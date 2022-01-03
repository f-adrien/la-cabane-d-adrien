# frozen_string_literal: true

module SidebarHelper
  def dashboard_tab_active
    params[:action] == 'dashboard' &&
      params[:controller] == 'admin'
  end

  def store_tab_active
    (%w[index new edit show].include? params[:action]) &&
      (['admin/products', 'admin/options', 'admin/taxes'].include? params[:controller])
  end

  def products_tab_active
    params[:action] == 'index' &&
      params[:controller] == 'admin/products'
  end

  def taxes_tab_active
    params[:action] == 'index' &&
      params[:controller] == 'admin/taxes'
  end
end
