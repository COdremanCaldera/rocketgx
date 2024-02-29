class VideogamesController < ApplicationController
  before_action :set_videogame, only: [:show]
  skip_before_action :authenticate_user!, only: %i[show index]

  def index
    @videogames = Videogame.all
  end

  def new
    @videogame = Videogame.new
  end

  def show
    @videogame = set_videogame
  end

  def create
    @videogame = Videogame.new(videogame_params)
    if @videogame.save
      redirect_to videogame_path(@videogame)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @videogame = Videogame.find(params[:id])
    @videogame.destroy

    redirect_to @videogame, status: :see_other
  end

  private

  def videogame_params
    params.require(:videogame).permit(:title, :rating, :condition, :price)
  end

  def set_videogame
    @videogame = Videogame.find(params[:id])
  end
end
