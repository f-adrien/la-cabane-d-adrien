# frozen_string_literal: true

class Admin::GeneralPolicy < AdminPolicy
  
  def dashboard?
    true
  end
end