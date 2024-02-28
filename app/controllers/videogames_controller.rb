class VideogamesController < ApplicationController
  def index
    @videogames = Videogame.all
  end

  def new
    @videogame = Videogame.new
  end

  def create
    @videogame = Videogame.new(videogame_params)
    if @videogame.save
      redirect_to @videogame
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
end
