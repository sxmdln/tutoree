class ApplicationController < ActionController::Base
    def is_logged_in
		if !session[:user_id].present?
			redirect_to "/login", notice: "Please Login"
		end
	end
	
	def is_admin
		if session[:is_type] != "admin"
			redirect_to "/dashboard", notice: "Forbidden"
		end
	end

	def is_activated
		if session[:user_id] !=nil && User.find(session[:user_id]).is_activated == false
			redirect_to '/verify'
		end
	end
end
