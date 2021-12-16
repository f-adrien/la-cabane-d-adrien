class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def after_sign_out_path_for(resource_or_scope)
    if params[:controller] == 'admins/sessions'
      new_admin_session_path
    else
      new_user_session_path
    end
  end
end
