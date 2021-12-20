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

  def options_tab_active
    params[:action] == 'index' &&
      params[:controller] == 'admin/options'
  end

  def taxes_tab_active
    params[:action] == 'index' &&
      params[:controller] == 'admin/taxes'
  end
end
