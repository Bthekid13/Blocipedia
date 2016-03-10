class WikiPolicy < ApplicationPolicy

  class Scope

    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      wikis = []
      if user.present? && user.role == 'admin'
        wikis = scope.all # If the user is an admin, they will see all of the wikis
      elsif user.present? && user.role == 'premium'
        all_wikis = scope.all
        all_wikis.each do |wiki|
          if wiki.private? != true || wiki.user == user || wiki.collaborators.include?(user)
            wikis << wiki # if the user is premium, only show them public wikis, or the private wikis they created or the private wikis they're working on w/ collaborators
          end
        end
      else # This is the common standard user
        all_wikis = scope.all
        wikis = []
          all_wikis.each do |wiki|
          if wiki.private? == false || wiki.collaborators.include?(user)
            wikis << wiki # only show standard users public wikis they won't be able to see private wikis, however.
          end
        end
      end
      wikis # Returns the wikis array that was built in the resolve method
    end
  end
end
