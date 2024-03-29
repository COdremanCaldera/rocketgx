class UsersController < ApplicationController
  def show_seller
    @videogame = set_params
    @user = @videogame.user
    @markers = [
      {
        lat: @user.latitude,
        lng: @user.longitude
      }
    ]
  end

  def show
    @user = current_user
    @markers = [
      {
        lat: @user.latitude,
        lng: @user.longitude
      }
    ]
  end

  private

  def set_params
    Videogame.find(params[:videogame_id])
  end
end
