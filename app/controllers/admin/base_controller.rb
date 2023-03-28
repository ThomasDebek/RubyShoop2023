# frozen_string_literal: true

class Admin::BaseController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  before_action :admin_authentication

  def admin_authentication
    unless admin_signed_in?
      flash[:alert] = 'You are not authorized.'
      redirect_to root_path
    end
  end

end

