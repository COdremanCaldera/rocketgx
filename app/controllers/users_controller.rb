class UsersController < ApplicationController

  def show_seller
    @videogame = Videogame.find(params[:videogame_id])
    @user = @videogame.user
  end

  def show
    @user = current_user
  end
end
