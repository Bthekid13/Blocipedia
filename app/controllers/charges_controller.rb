class ChargesController < ApplicationController

  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "BigMoney Membership - #{current_user.email}",
      amount: 1500
    }
  end

  def create

    customer = Stripe::Customer.create(
    email: current_user.email,
    card: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
    customer: customer.id, # Note -- this is NOT the user_id in your app
    amount: 1500,
    description: "Premium Membership - #{current_user.email}",
    currency: 'usd'
    )

    if charge.present? && current_user.upgrade_to_premium
      flash[:notice] = "Thanks for all the money, #{current_user.email}! Feel free to pay me again."
    else
      flash[:alert] = "There was an error in processing your account upgrade."
    end

    redirect_to root_path
  end


  # Stripe will send back CardErrors, with friendly messages
  # when something goes wrong.
  # This `rescue block` catches and displays those errors.
rescue Stripe::CardError => e
  flash.now[:alert] = e.message
  redirect_to new_charge_path


end
