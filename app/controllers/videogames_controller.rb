class VideogamesController < ApplicationController
  before_action :set_videogame, only: [:show]
  skip_before_action :authenticate_user!, only: %i[show index]

  def index
    @videogames = Videogame.all
    if params[:query].present?
      @videogames = Videogame.search_by_title(params[:query])
    end
  end

  def new
    @videogame = Videogame.new
  end

  def show
    @videogame = set_videogame
    @photo = @videogame.photo
  end

  def create
    @videogame = Videogame.new(videogame_params)
    @videogame.user_id = current_user.id
    if @videogame.save
      redirect_to videogame_path(@videogame)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    if current_user.id == set_videogame.user.id
      @videogame = set_videogame
    else
      redirect_to videogames_path
    end
  end

  def update
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
    params.require(:videogame).permit(:title, :rating, :condition, :price, :photo)
  end

  def set_videogame
    @videogame = Videogame.find(params[:id])
  end
end
