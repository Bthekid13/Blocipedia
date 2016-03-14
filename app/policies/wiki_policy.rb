class WikiPolicy < ApplicationPolicy

  class Scope

    attr_reader :user, :scope, :wiki

    def initialize(user, scope)
      @user = user
      @scope = scope
      @wiki = wiki
    end

    def resolve

      def resolve
        if user.admin?
          scope.all
        else
          scope.where(private: false)
        end
      end
    end

    def update?
      user.admin? || user.premium
    end
  end
