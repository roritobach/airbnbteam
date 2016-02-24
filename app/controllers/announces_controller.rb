class AnnouncesController < ApplicationController

  def index
    @announces = Announce.all
  end

  def show
    @announce = Announce.find(params[:id])
  end

  def new
    @announce = Announce.new
  end

  def create
    @announce = Announce.new(announce_params)
    # @announce.user = current_user
    @announce.save
    redirect_to announces_path
  end

  def announce_params
    params.require(:announce).permit(:description,:name)
  end

end
