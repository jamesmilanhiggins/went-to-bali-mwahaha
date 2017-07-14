class OrderItemsController < ApplicationController

  def create
    @order = current_order
    @item = @order.order_items.new(item_params)
    session[:order_id] = @order.id
    @order.save
    redirect_to products_path
    respond_to do |format|
      format.html { redirect_to products_path}
      format.js
    end
    def show
      @order = Order.find(params[:id])


    end

  end

  def update
    @order = current_order
    @item = @order.order_items.find(params[:id])
    @item.update_attributes(item_params)
    @order.save
    # respond_to do |format|
    #   format.js
    # end
  end

  def destroy
    @order = current_order
    @item = @order.order_items.find(params[:id])
    @item.destroy
    @order.save
    # byebug
    redirect_to cart_path
    respond_to do |format|
      format.js
    end
  end

  private

  def item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end
