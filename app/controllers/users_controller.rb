class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
     @user = User.new(user_params)
     redirect_to announce_path(announce)
     @user.save
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.new(user_params)
    redirect_to announce_path(announce)
    @user.save
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to announces_path
  end
end
