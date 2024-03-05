class UsersController < ApplicationController
  def show_seller
    @videogame = set_params
    @user = @videogame.user
  end

  def show
    @user = current_user
  end

  def edit
  end

  private

  def set_params
    Videogame.find(params[:videogame_id])
  end
end
