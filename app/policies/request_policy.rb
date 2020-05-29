class RequestPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(request_id: @request.id)
    end
  end

  def new?
    true
  end

  def create?
    true
  end
end
