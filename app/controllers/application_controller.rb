# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_current_user_id_cookie

  rescue_from CanCan::AccessDenied do |_exception|
    redirect_to inbox_projects_path, alert: 'You are not authorized to access this page.'
  end

  private

  def set_current_user_id_cookie
    cookies[:current_user_id] = current_user&.id
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
