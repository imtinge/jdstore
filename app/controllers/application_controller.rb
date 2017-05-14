class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
   skip_before_action :verify_authenticity_token
  include CartsHelper

  def admin_required
    unless current_user.admin?
      redirect_to root_path, alert: 'You are not admin'
    end
  end
end
