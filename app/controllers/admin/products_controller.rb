class Admin::ProductsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def index
    #@products = Product.includes([:category]).includes([:brand]).all

    @products = Product.includes([:main_image_attachment]).all
    @products = @products.filter_by_category(params[:category]) if params[:category].present?
    @products = @products.filter_by_brand(params[:brand]) if params[:brand].present?
  end
end
