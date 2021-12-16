# frozen_string_literal: true

class AdminPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def create?
    user.admin_level != 'seaman'
  end

  def update?
    user.admin_level != 'seaman'
  end

  def destroy?
    user.admin_level == 'admiral'
  end
end