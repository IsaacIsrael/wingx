class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user?
  end

  private

  def user?
    record.flight.company.user != user
  end
end
