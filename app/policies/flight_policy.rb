class FlightPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user.company
  end

  def new?
    user.company
  end

  def show
    true
  end

  def index
    true
  end
end
