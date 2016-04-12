class ListingsController < ApplicationController

	def index
		@listings = Listing.all

	end 

	def new
	    @listing = Listing.new
	end

	def show
		@listing = Listing.find(params[:id])
	end

	def edit
		@listing = Listing.find(params[:id])
	end

	def update
	  @listing = Listing.find(params[:id])
	   if @listing
	      @listing.update(listing_params)   #the name of private method below i.e. def listing_params
	      redirect_to listing_path
	  end
	end

	def create
		@user = current_user
		@listing = @user.listings.new(listing_params)
		if @listing.save
			flash[:notice] = "Listing created!"
			redirect_to listings_path
		else 
			flash[:notice] = "Something went wrong. Please try again"
			redirect_to new_listing_path
		end 
	end 

	def destroy
		@listing = Listing.find_by(id: params[:id])
	    @listing.delete unless @listing.nil?
	    redirect_to listings_path
	end

 private

 def listing_params
 	
 	params.require(:listing).permit(:description, :city, :room_type, :price, :accomodates, {images: []})

 end
end
