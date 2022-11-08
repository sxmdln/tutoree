class TutorsController < ApplicationController

    def index
    end

    def show
        @tutors = Tutor.all
    end

    def edit
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
        params.require(:tutor).permit(:first_name, :last_name, :profile_picture, :birthdate, :address, :occupation, :skill_category, :certification, :price_per_hour, :average_rating, :number_of_reviews, :number_of_tutees, :is_active, :payment_info)
        end

end
