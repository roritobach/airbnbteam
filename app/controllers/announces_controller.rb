class AnnouncesController < ApplicationController

  def index
    @announces = Announce.all
  end

  def show
    @announce = Announce.find(params[:id])
  end

  def new
    @announce = Announce.new
    @photos = @announce.photos.build
  end

  def create
    @announce = Announce.new(announce_params)
    @announce.save
    if params[:announce]['photos']
      params[:announce]['photos'].each do |p|
        @announce.photos.create!(photo: p, announce: @announce)
      end
    end
    redirect_to announces_path
  end

  def announce_params
    params.require(:announce).permit(:description,:name, photos_attributes: [:id,:announce_id,:description,:_destroy])
  end

end
