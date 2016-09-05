class ReservationsController < ApplicationController

 def index
    # @reservations = Reservation.all
    @user = User.find(params[:user_id])
    @reservations = @user.reservations
    # @reservation = Reservation.find(params[:listing_id])
    # @listing = Listing.find(params[:listing_id])
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def my_reservations

  end 

  def new
    @reservation = Reservation.new
    @listing = Listing.find(params[:listing_id])
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    if params[:reservation]
      @reservation.update(reservation_params)
    end
      redirect_to reservation_path
  end

  def create
  	@user = current_user
    @reservation = @user.reservations.new(reservation_params) 
    if @reservation.save
      flash[:notice] = "Reservation created!"
      redirect_to listing_reservations_path
      ExampleMailer.sample_email(@user).deliver

    else
      flash[:blocked] = "There was error. Please try again"
      redirect_to :back
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy unless @reservation.nil?
    redirect_to(reservations_path)
  end

private
  

 def get_listing
 	@listing = Listing.find(params[:listing_id])
 end 

  def reservation_params
    params.require(:reservation).permit(:user_id, :listing_id, :from, :to)

  end
end 

