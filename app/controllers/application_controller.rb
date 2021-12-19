class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def render_turbo_flashes(flash_type, message)
    flash.now[flash_type] = message
    render turbo_stream: turbo_stream.update(:flashes, partial: 'shared/flashes')
  end

  def after_sign_out_path_for(resource_or_scope)
    if params[:controller] == 'admins/sessions'
      new_admin_session_path
    else
      new_user_session_path
    end
  end
end
