class AnnouncesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @announces = Announce.all
    @markers = Gmaps4rails.build_markers(@announces) do |announce, marker|
      marker.lat announce.latitude
      marker.lng announce.longitude
    end
  end

  def show
    @announce = Announce.find(params[:id])
    @announce_coordinates = { lat: @announce.latitude, lng: @announce.longitude }
    @alert_message = "You are viewing #{@announce.name}"
  end

  def new
    @announce = Announce.new
    @photos = @announce.photos.build
  end

  def create
    @announce = Announce.new(announce_params)
    @announce.user = current_user


    if @announce.save

      if params[:announce]['photos']
        params[:announce]['photos'].each do |p|
         @announce.photos.create!(photo: p, announce: @announce)
        end
      end

      redirect_to announce_path @announce
    else
      render :new
    end
  end

  def edit

  @announce = Announce.find(params[:id])

  end

  def update
      @announce = Announce.new(announce_params)
   if  @announce.save
    if params[:announce]['photos']
      params[:announce]['photos'].each do |p|
        @announce.photos.create!(photo: p, announce: @announce)
      end
    end
    redirect_to announces_path
    end
  end


  def destroy
    @announce = Announce.find(params[:id])
    @announce.delete
  end


private


  def announce_params
    params.require(:announce).permit(:description,:name, photos_attributes: [:id,:announce_id,:description,:_destroy])
  end

end
