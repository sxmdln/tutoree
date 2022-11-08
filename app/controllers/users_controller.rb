class UsersController < ApplicationController
	before_action :is_logged_in, except: [:login, :create_login, :logout, :index, :new, :create]
	#before_action :is_admin, except: [:login, :create_login, :logout, :index, :create]
	def index 
	end
	def login
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

	def job_dashboard

	end

	def logout
		session[:user_id] = nil
		session[:is_type] = nil
		redirect_to "/login", notice: "logout success"
	end
	def new
		@user = User.new
	end
	 
	def create
		@user = User.new(user_params)
		@user.password_digest = BCrypt::Password.create(@user.password)
		respond_to do |format|
			if @user.save
				if @user.type == "tutee"
					tutee = Tutee.new(
						user_id: @user._id
					)
					tutee.save!
				elsif @user.type == "tutor"
					tutor = Tutor.new(
						user_id: @user._id
					)
					tutor.save!
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
				:email_address, :password, :type, :contact_number,
				tutees_attributes: [:first_name, :last_name, :profile_picture, :birthdate, :address, :school_id, :matriculation_form],
				tutors_attributes: [:first_name, :last_name, :profile_picture, :birthdate, :address, :occupation, :skill_category, :certification]
			)
		end
end
