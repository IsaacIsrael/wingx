class CompanyPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    !comapany?
  end

  def show?
    company_owner?
  end

  private

  def comapany?
    user.company
  end

  def company_owner?
    comapany? && record.user == user
  end
end
