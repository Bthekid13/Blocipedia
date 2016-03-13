class WikiPolicy < ApplicationPolicy

  def show?
    user.present? && [:admin, :premium, :standard].include?(user.role)
  end

  def new?
  end

  def edit?
  end

  def create?
  end


  #Filters unauthorized records out of a collection.
  class Scope

    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.where(private: false)
    end
  end
end
