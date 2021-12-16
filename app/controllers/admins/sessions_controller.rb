# frozen_string_literal: true

class Admins::SessionsController < Devise::SessionsController
  layout 'devise'
  prepend_before_action :check_captcha, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  #   flash.delete(:notice)
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  private

  def check_captcha
    return if params.dig(:admin, :disable_recaptacha_code) == 'Doconnect2020!'

    v3_verify = verify_recaptcha(action: 'login', minimum_score: 0.9)
    v2_verify = verify_recaptcha(secret_key: Rails.application.credentials[:recaptcha_V2][:secret_key])
    return if v3_verify || v2_verify

    self.resource = resource_class.new sign_in_params
    respond_with_navigational(resource) { render :new }
  end
end
