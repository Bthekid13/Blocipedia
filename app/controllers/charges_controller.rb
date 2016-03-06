class ChargesController < ApplicationController

  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "BigMoney Membership - #{current_user.email}",
      amount: 1500
    }
  end

  def create
    # I opted to use a subscription over a single charge plan, but this is the code
    # for a single charge

    # charge = Stripe::Charge.create(
    # customer: customer.id, # Note -- this is NOT the user_id in your app
    # amount: Amount.default,
    # description: "BigMoney Membership - #{current_user.email}",
    # currency: 'usd'
    # )
      customer = Stripe::Customer.create(
      email: current_user.email,
      plan: '1111',
      card: params[:stripeToken],
      customer: customer.id
      )

      current_user.subscribed = true
      current_user.stripeid = customer.id
      subscription =
      current_user.save

    if current_user.subscribed?
      current_user.update_attributes(role: 2)
    end
    flash[:notice] = "Thanks for all the money, #{current_user.email}! Feel free to pay me again."
    redirect_to root_path
  end

  def destroy

    # # customer = Stripe::Charge.retrieve(id: "ch_17llMsFVfN4XkAreP25C8hkJ", expand: ['customer'])
    #
    # customer = Stripe::Customer.retrieve({current_user.stripeid})
    # customer.subscriptions.retrieve({SUBSCRIPTION_ID}).delete
  end

  # Stripe will send back CardErrors, with friendly messages
  # when something goes wrong.
  # This `rescue block` catches and displays those errors.
  rescue Stripe::CardError => e
    flash.now[:alert] = e.message
    redirect_to new_charge_path


end
