class UsersController < ApplicationController
before_action :require_login
	def show
		@listing = Listing.new #because routing from listing view
		@reservations = current_user.reservations
	end 
	
	def edit
    	@user = current_user
  	end

  	def update
	  @user = current_user
	   if @user
	    @user.update(user_params) 
	    flash[:notice] = "Profile is successfully edited!"
	    redirect_to user_path
	  end
	end

def user_params
 	params.require(:user).permit(:email,:image)
 end

end

