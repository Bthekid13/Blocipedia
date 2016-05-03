class UsersController < ApplicationController

  def show
    @user = current_user
    @wikis = Wiki.personal_wikis(current_user) + Wiki.shared_wikis(current_user)
  end

end
