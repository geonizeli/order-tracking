class TrackingController < ApplicationController
  def index
    customer_email = params[:query]
    customer = Customer.find_by(email: customer_email)

    if customer&.orders&.any?
      @orders = customer.orders.where.not(status: :canceled)
    elsif params[:query].present?
      @notice = "Oops! We couldn't find a order associated with that email address."
    end
  end
end
