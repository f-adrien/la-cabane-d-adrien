# frozen_string_literal: true

class AdminPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end

  def load_index?
    true
  end

  def new?
    true
  end

  def create?
    user.admin_level != 'seaman'
  end

  def edit?
    true
  end

  def update?
    user.admin_level != 'seaman'
  end

  def destroy?
    user.admin_level == 'admiral'
  end
end