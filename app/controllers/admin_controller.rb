class AdminController < ApplicationController
  before_action :authenticate_admin!
  after_action :verify_authorized

  layout 'admin'

  def dashboard
    authorize %i[admin general]
    @start_date = DateTime.now.in_time_zone('Paris').beginning_of_day - 1.month
    @end_date = DateTime.now.in_time_zone('Paris').end_of_day
  end

  private

  def pundit_user
    current_admin
  end
end
