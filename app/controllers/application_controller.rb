class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :role_change
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protect_from_forgery with: :exception

  def role_change
    ActiveRecord::Base.transaction do
      if User.update_attributes(role: 1)
        User.update_attributes(private: false)
      end
    end
  end

  private
  #
  def user_not_authorized
    flash[:alert] = "You must be an admin to do that"
    redirect_to (request.referrer || root_path )
  end




end
