class TuteesController < ApplicationController

    def index
    end

    def show
        @tutees = Tutee.all
    end

    def edit
    end

    def update
    end

    def dashboard
        @tutees = Tutee.all
    end

    private
        def set_tutee
            @tutor = Tutor.find(params[:id])
        end

    # Only allow a list of trusted parameters through.
        def tutee_params
        params.require(:tutee).permit(:first_name, :last_name, :profile_picture, :birthdate, :address, :school_id, :matriculation_form, :is_active, :payment_info)
        end


end
