# frozen_string_literal: true

class Admin::ProductsController < Admin::BaseController
  before_action :set_product, only: %i[ update destroy edit show ]

  def index
    @products = Product.includes(:category, :brand).all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
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
    @product.destroy

    redirect_to admin_products_path, notice: 'Product deleted successfully'
  end

  def update
    if @product.update(product_params)
      redirect_to admin_products_path, notice: 'Product was successfully updated'
    else
      render edit_admin_product_path
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :category_id, :brand_id, :main_image)
  end
end

