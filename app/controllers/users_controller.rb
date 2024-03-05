class UsersController < ApplicationController
  def show_seller
    @videogame = Videogame.find(params[:videogame_id])
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
end
