class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def update?
    true
  end

  def toggle_helper?
    true
  end

  def destroy_photo?
    true
  end
end
