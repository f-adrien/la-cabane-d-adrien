# frozen_string_literal: true

class Admin::ProductPolicy < AdminPolicy
  def edit_product_tax?
    true
  end

  def update_product_tax?
    true
  end
end
