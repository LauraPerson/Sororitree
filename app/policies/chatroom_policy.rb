class ChatroomPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user == record.guest_user
  end

  def show?
    user == record.user || user == record.guest_user
  end

  def index?
    user == record.user || user == record.guest_user
  end

  def destroy?
    user == record.user
  end
end
