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
    comapany?
  end

  private

  def comapany?
    user.company
  end
end
