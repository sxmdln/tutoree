class UsersController < ApplicationController
	def index 
	end
	def login
		#@users = User.all
	end
	def create_login
		user = User.find_by(email_address: params[:email_address])
		
		if user && user.authenticate(params[:password])
			redirect_to '/login', notice: 'success'
		else
			
			redirect_to '/login', notice: 'fail'
		end

	end
	def new
		@user = User.new
	end
	 
	def create
		@user = User.new(user_params)
		@user.password = BCrypt::Password.create(@user.password)
		respond_to do |format|
			if @user.save
			  format.html { redirect_to '/login', notice: "User was successfully created." }
			else
			  format.html { render :new, status: :unprocessable_entity }
			  format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
	end
	private
		def user_params
			params.require(:user).permit(:email_address, :password)
		end
end
