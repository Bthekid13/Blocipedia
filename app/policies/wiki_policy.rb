class WikiPolicy < ApplicationPolicy

def index?
  true
end

def show
  true
end

  class Scope

    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.admin?
        scope.all
      else
        scope.where(user: @user) + scope.joins(collaborations: @user)

            # This list all collaborations -> scope.joins(collaborations: :user)

      end
    end
  end
end
