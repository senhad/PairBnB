class TransactionsController < ApplicationController

  def new
    @client_token = Braintree::ClientToken.generate
    @reservation = Reservation.find(params[:id])
    @transaction = Transaction.new
    @length_of_stay = @reservation.to - @reservation.from
    @listing = Listing.find(@reservation.listing_id)
    @total_amount = @length_of_stay.to_i * @listing.price.to_i  #need to have to_i since it is given s  fraction and second  one cause it is set as a string
  end

def create
    nonce = params[:payment_method_nonce]
      @client_token = Braintree::ClientToken.generate
      @reservation = Reservation.find(params[:transaction][:reservation_id])
      if result.success?

      @transaction = Transaction.create(:reservation_id params[:transaction_id])
      @length_of_stay = @reservation.to - @reservation.from
      @listing = Listing.find(@reservation.listing_id)
      @total_amount = @length_of_stay.to_i * @listing.price.to_i
    result = Braintree::Transaction.sale(
      amount: "#{@total_amount}",
      payment_method_nonce: params[:payment_method_nonce]
    )
    redirect_to listings_path
  end
end 


end

