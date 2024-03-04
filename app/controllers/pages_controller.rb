class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @user = User.find(current_user.id) if current_user.photo_user.key
  end
end
