class WikiPolicy < ApplicationPolicy

  def index
    return true unless record.private?
    if record.private?
      return false unless user.premium? || user.admin?
    end
  end

  def create?
    return user.present?
    if record.private?
      user.present? && (user.admin? || user.premium?)
    end
  end

  def update?
    return false unless user.present?
    if record.private?
      return false unless user.premium? || user.admin? || record.user == user
    end
    user.admin? || record.user == user
  end


  def destroy?
    user.present? && user.admin?
  end

  def show?
    return true unless record.private?
    user.present? && (user.admin? || user.premium?)
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
        (scope.public_wikis + scope.shared_wikis(user) + scope.personal_wikis(user)).uniq
      end
    end
  end
end
