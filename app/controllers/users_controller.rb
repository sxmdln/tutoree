class UsersController < ApplicationController
	before_action :is_logged_in, except: [:login, :create_login, :logout, :index, :new, :create]
	before_action :is_activated, except: [:login, :create_login, :logout, :index,:new, :create, :verify]
	
	def index 
	end
	
	def login
		if session[:user_id] == nil
			return true
		else
			redirect_to '/dashboard'
		end
	end
	## users/id
	def profile
		@user = User.find(params[:id])
	end

	def edit
	end

	def create_login
		user = User.find_by(:email_address => params[:email_address])	
		if !user
			#render json: {msg: 'User does not exist'}, status: :unprocessable_entity
			redirect_to '/login', notice: 'does not exist'

        	return true
        end
        if user && user.authenticate(params[:password])
            #render json: {msg: 'Success', user: user}, status: :ok
			session[:user_id] = user._id
			session[:is_type] = user.type
			redirect_to '/dashboard', notice: 'success!'
        else 
			redirect_to '/login', notice: 'user password does not match'
            #render json: {msg: 'Incorrect Password', user: user.password_digest }, status: :unprocessable_entity
        end
	end
	
	def dashboard
        @posts = Post.all
		@accepted_tutees = AcceptedTutee.all
    end

	# def dashboard
	# 	# tutee can only post jobs
	# 	if @user.type == "tutee"
	# 		@user = User.find(params[:post_id])
	# 	elsif @user.type == "tutor"
	# 	end
	# end
	
	def verify
		if User.find(session[:user_id]).is_activated == true

			redirect_to '/dashboard'
		end
	end

	def logout
		session[:user_id] = nil
		session[:is_type] = nil
		redirect_to "/login", notice: "logout success"
	end
	
	def new
		if session[:user_id] == nil
			@user = User.new
		else
			redirect_to '/dashboard'
		end
		
	end
	 
	def create
		@user = User.new(user_params)
		@user.password_digest = BCrypt::Password.create(@user.password)
		@user.is_activated = false;
		respond_to do |format|
			if @user.save
				if @user.type == "tutee"
					@user.create_tutees(
						user_id: @user._id,
						first_name: params[:user][:first_name],
						last_name: params[:user][:last_name],
						address: params[:user][:address],
						matriculation_form: params[:user][:document]

					)
					
				elsif @user.type == "tutor"
					@user.create_tutors(
						user_id: @user._id,
						first_name: params[:user][:first_name],
						last_name: params[:user][:last_name],
						address: params[:user][:address],
						certification: params[:user][:document]
					)
				end
				format.html { redirect_to '/login', notice: "User was successfully created." }
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
			params.require(:user).permit(
				:email_address, :password, :type, :contact_number, :is_activated,
				tutees_attributes: [:first_name, :last_name, :profile_picture, :birthdate, :address, :school_id, :matriculation_form],
				tutors_attributes: [:first_name, :last_name, :profile_picture, :birthdate, :address, :occupation, :skill_category, :certification]
			)
		end
end
