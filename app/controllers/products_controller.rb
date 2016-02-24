class ProductsController < ApplicationController
  def index

    @products= Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to products_path

  end

  def destroy
    @product = Product.find(params[:id])
    @product.delete

  end


  def product_params
  params.require(:product).permit(:name, :description, :photo, :photo_cache)
  end

end
