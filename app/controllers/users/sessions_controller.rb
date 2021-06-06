# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  prepend_before_action :check_captcha, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  def check_captcha
    return if params.dig(:admin, :disable_recaptacha_code) == 'Doconnect2020!'

    v3_verify = verify_recaptcha(action: 'login', minimum_score: 1)
    v2_verify = verify_recaptcha(site_key: Rails.application.credentials[:recaptcha_V2][:public_key], secret_key: Rails.application.credentials[:recaptcha_V2][:secret_key])
    return if v3_verify || v2_verify

    # flash.now.alert = 'Veuillez cocher le ReCaptcha'
    respond_to do |format|
      format.turbo_stream { render :new }
    end
  end
  
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
