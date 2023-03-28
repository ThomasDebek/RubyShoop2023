# frozen_string_literal: true

class Admin::ProductsController < Admin::BaseController
  def index
    @products = Product.includes(:category, :brand).all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_products_path, notice: 'Product added successfully'
    else
      render :new
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to admin_products_path, notice: 'Product deleted successfully'
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :category_id, :brand_id, :main_image)
  end
end

