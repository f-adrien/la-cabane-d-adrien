# frozen_string_literal: true

module SidebarHelper
  def dashboard_tab_active
    params[:action] == 'dashboard' &&
      params[:controller] == 'admin'
  end

  def products_tab_active
    params[:action] == 'index' &&
      params[:controller] == 'admin/products'
  end
end