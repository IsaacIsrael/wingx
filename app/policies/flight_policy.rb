class FlightPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user ? scope.where.not(company: user.company) : scope.all
    end
  end

  def show?
    true
  end

  def destroy?
    record.company.user == user
  end

  def update?
    record.company.user == user
  end

  def create?
    user.company
  end

  def new?
    user.company
  end
end
