class AdminController < ApplicationController
    before_action :is_logged_in
	before_action :is_admin
    def index
        @users = User.all
    end
    def delete
        @user = User.find(params[:id])
        @user.destroy
        redirect_to '/admin'
    end
    def approve
        @user = User.find(params[:id])
        @user.is_activated = true
        @user.save!
        redirect_to '/admin'
    end
end
