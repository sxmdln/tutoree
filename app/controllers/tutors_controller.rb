class TutorsController < ApplicationController
    before_action :is_logged_in, except: [:login, :create_login, :logout, :index, :new, :create]

    def index
    end
    
    def show
        @tutors = Tutor.all
    end

    def new
        @tutor = Tutor.new()
    end

    def edit
    end

    def create
        @tutor = Tutor.new(tutor_params)
        respond_to do |format|
            if @tutor.save
                format.html { redirect_to "/dashboard", notice: "Personal information for tutor is successfully created" }
                # format.json { render :show, status: :created, location: @tutor }
            else
                format.html { render :new, status: :unprocessable_entity }
                # format.json { render json: @tutor.errors, status: :unprocessable_entity }
            end
        end
    end

    def update
    end

    def dashboard
        @tutors = Tutor.all
    end

    private
        def set_tutor
            @tutor = Tutor.find(params[:id])
        end

    # Only allow a list of trusted parameters through.
        def tutor_params
        params.require(:tutor).permit(
            :first_name, :last_name, :profile_picture, :birthdate, :address, :occupation, :skill_category, :certification, :price_per_hour, :average_rating, :number_of_reviews, :number_of_tutees, :is_active, :payment_info,
            accepted_tutee_attributes: [:status]
        )
        end

end
