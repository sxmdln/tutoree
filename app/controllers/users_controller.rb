class UsersController < ApplicationController
	def index 
		puts Tutee.all
	end
	def login
	end
	def create_login
		user = User.find_by(:email_address => params[:email_address])	
		if !user
        	return true
        end
        if user && user.authenticate(params[:password])
			redirect_to '/login', notice: "success!"
        else
            redirect_to '/login', notice: "fail!"
        end

	end
	def new
		@user = User.new
		puts @user.tutee
	end
	 
	def create
		@user = User.new(user_params)

		@user.password_digest = BCrypt::Password.create(@user.password)
		
		respond_to do |format|
			if @user.save 
				tutee = Tutee.create(_id: @user._id, user_id: @user.email_address)	
				format.html { redirect_to '/login', notice: "User was successfully created."}
			else
			  	format.html { render :new, status: :unprocessable_entity }
			  	format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
	end
	private
		def set_user
			@user = User.find(params[:id])
		end

		def user_params
			params.require(:user).permit(:email_address, :password, :contact_number, :type)
		end
end
