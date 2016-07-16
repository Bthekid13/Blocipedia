class ApplicationPolicy
  attr_reader :user, :record

  #Roles: Admin, Standard, Premium

  def initialize(user, record)
    @user = user
    @record = record
  end

def index
    return true unless record.private?
    if record.private?
      return false unless user.premium? || user.admin?
    end
  end

  def show?
    scope.where(id: record.id).exists?
  end

  def create?
    index?
  end

  def new?
    create?
  end

  def update?
    user.present?
  end

  def edit?
    update?
  end

  def destroy?
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
