class PagesController < ApplicationController
  def home
    @active_filters = filters_params || { filters: "" }

    @products = Product.all
    @products = @products.filter_by_category(params[:category]) if params[:category].present?
    @products = @products.filter_by_brand(params[:brand]) if params[:brand].present?
  end

  def filters_params
    params.permit(:category, :brand)
  end

end
