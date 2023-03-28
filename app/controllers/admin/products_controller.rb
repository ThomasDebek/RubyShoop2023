# frozen_string_literal: true

module Admin
  class ProductsController < Admin::BaseController
    # layout 'admin'
    # before_action :authenticate_admin!

    def index
      # @products = Product.includes([:category]).includes([:brand]).all

      @products = Product.includes([:main_image_attachment]).all
      @products = @products.filter_by_category(params[:category]) if params[:category].present?
      @products = @products.filter_by_brand(params[:brand]) if params[:brand].present?
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
end
