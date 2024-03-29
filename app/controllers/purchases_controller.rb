class PurchasesController < ApplicationController
  def new
    @purchase = Purchase.new
    @videogame = Videogame.find(params[:videogame_id])
  end

  def show
    @purchase = set_purchase
    @photo = @videogame.photo
  end

  def thankyou
  end

  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.user_id = current_user.id
    if @purchase.save
      redirect_to videogame_purchase_path(@purchase)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @purchase = Purchase.find(params[:id])
    @purchase.destroy

    redirect_to @purchase, status: :see_other
  end

  private

  def purchase_params
    params.require(:purchase).permit(:price, :videogame_id)
  end

  def set_purchase
    @purchase = Purchase.find(params[:id])
  end
end
