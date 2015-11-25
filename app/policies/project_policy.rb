class ProjectPolicy < ApplicationPolicy
  def new?
    @user.present? && (@user.organization? || @user.investor?)
  end

  def create?
    @record.projectable == @user.profile
  end

  def update?
    create?
  end

  def edit?
    create?
  end

  def show?
    true
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
