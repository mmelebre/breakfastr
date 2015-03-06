class OrdersController < ApplicationController
  def new
    @pastry = Pastry.find(params[:pastry_id])
    # @orders = Order.new would simply generate an empty line in the columm, while @order = @pastry.orders.new will populate some of the fields. 
  	@order = @pastry.orders.new
  end

  def create
    @pastry = Pastry.find(params[:pastry_id])
  	@order = @pastry.orders.new(order_params)
    @order.user_id = current_user.id
  	if @order.save
  		flash[:success] = "Your '#{@pastry.name}' has been baked!"
      logger.debug @order
  		redirect_to root_path
      # Try to charge card here
      Stripe.api_key = Rails.application.secrets.stripe_secret_key

      Stripe::Charge.create(
      :amount => @pastry.price_in_pence,
      :currency => "gbp",
      :source => @order.stripe_token, # obtained with Stripe.js
      :description => "Charge for #{@order.user.email}."
      )


  	else
  		flash[:error] = "Oops, your '#{@pastry.name}' didn't bake! Please put it back in the oven and try your card details again!"
  		render :new
  	end		
  end

  def show
  	@order = Order.find(params[:id])
  end

  private
  def order_params
  	params.require(:order).permit(:stripe_token)
  end
end
