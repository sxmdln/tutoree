class UsersController < ApplicationController
	def login
		#@users = User.all
	end
	def create_login
		user = User.find_by(email_address: params[:email_address])
			
		if user.exists? && user.authenticate(params[:password])
			redirect_to '#', notice: 'success'		
		else
			redirect_to '#', notice: 'fail'				
		end			
	end
end
