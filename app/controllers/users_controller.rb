class UsersController < ApplicationController

  def downgrade
    current_user.update_attributes(role: 1)

    current_user.wikis.each do |wiki|
      wiki.update_attributes(private: false)
    end
    redirect_to root_path
  end
end
