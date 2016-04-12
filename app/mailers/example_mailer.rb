class ExampleMailer < ApplicationMailer
	  default from: "senad.pairbnb@gmail.com"
	
	def sample_email(user)
		
   @user = user
    	mail(to: @user.email, subject: 'Booking Confirmation')
  	end

end
