class UsersController < ApplicationController

  def downgrade
    current_user.update_attributes(role: 0)

    current_user.wikis.each do |wiki|
      wiki.update_attributes(private: false)
    end
    redirect_to root_path
    flash[:notice] = "Your Premium status has been changed to Standard. All of your Wikis are now public."
  end
  #
  def keep
    redirect_to root_path
    flash[:notice] = "Your Premium status remains intact."
  end

  def show
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "BigMoney Membership - #{current_user.email}",
      amount: 1500
    }
  end
end
