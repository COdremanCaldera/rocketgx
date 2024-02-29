class PurchasesController < ApplicationController
  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.user_id = current_user.id
    if @purchase.save
      redirect_to @purchase
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:price, :videogame_id)
  end
end
