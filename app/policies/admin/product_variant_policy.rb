# frozen_string_literal: true

class Admin::ProductVariantPolicy < AdminPolicy
  def new?
    true
  end
end
