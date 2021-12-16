class AdminController < ApplicationController
  before_action :authenticate_admin!
  after_action :verify_authorized
  require 'will_paginate/array'

  layout -> { 'admin' if turbo_frame_request? }

  def dashboard; end

  private

  def pundit_user
    current_admin
  end
end
