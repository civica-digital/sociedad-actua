class OrganizationPolicy < ApplicationPolicy
  def update?
    @user == @record
  end

  def show?
    true
  end

  def causes?
    true
  end

  def send_message?
    true
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
