class OrdersController < ApplicationController
  def create
  end

  private

  def order_params
    params.require(:person).permit(:name, :phone)
  end
end
