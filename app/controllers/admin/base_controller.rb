# frozen_string_literal: true

module Admin
  class BaseController < ApplicationController
    layout 'admin'
    before_action :authenticate_admin!
    before_action :admin_authentication

    def admin_authentication
      return if admin_signed_in?

      flash[:alert] = 'You are not authorized.'
      redirect_to root_path
    end
  end
end
