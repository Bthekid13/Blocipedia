class UsersController < ApplicationController

  def downgrade

    redirect_to root_path
    flash[:notice] = "Your Premium status has been changed to Standard. All of your Wikis are now public."
  end
  #
  def keep
    redirect_to root_path
    flash[:notice] = "Your Premium status remains intact."
  end
end
