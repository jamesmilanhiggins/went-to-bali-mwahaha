class ProductsController < ApplicationController
  before_filter :authorize, except: [:index, :show]

  def index
    @products = Product.all
    @order_item = current_order.order_items.new

  end

  def show
   @product = Product.find(params.fetch(:id))
   respond_to do |format|
     format.html { redirect_to product_path(@product) }
     format.js
   end
 end


  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "You successfully updated a product"
      redirect_to edit_product_path
    else
      render :edit
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "You added a new product"

      redirect_to '/'
    else
      render :new
    end
  end
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "You deleted a product"
    redirect_to root_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price)
  end
end
