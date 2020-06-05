class MatchingProfilePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def new?
    true
  end

  def create?
    true
  end

  def accepted_true?
    true
  end

  def accepted_false?
    true
  end
end
