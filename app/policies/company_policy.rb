class CompanyPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    !company?
  end

  def show?
    company?
  end

  private

  def company?
    user.company
  end
end
