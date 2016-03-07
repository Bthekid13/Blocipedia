class UsersController < ApplicationController

  def downgrade
    @user = User.find(params[:id])
    if @user.downgrade_to_standard
      flash[:notice] = "Your Premium status has been changed to Standard. All of your Wikis are now public."
    else
      flash[:alert] = "An error has occurred when attempting to convert your account."
    end
    redirect_to root_path
  end

  private

end
