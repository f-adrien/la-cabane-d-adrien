# frozen_string_literal: true

class Admin::ProductPolicy < AdminPolicy
  def index?
    true
  end
end
