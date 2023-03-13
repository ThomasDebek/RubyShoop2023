class Admin::ProductsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def index
    @products = Product.all
  end
end
