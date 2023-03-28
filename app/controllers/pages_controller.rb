# frozen_string_literal: true

class PagesController < ApplicationController
  before_action :initialize_cart
  def home
    @products = Product.includes([:main_image_attachment]).all
    @products = @products.filter_by_category(params[:category]) if params[:category].present?
    @products = @products.filter_by_brand(params[:brand]) if params[:brand].present?
  end

  def filters_params
    params.permit(:category, :brand)
  end
end
