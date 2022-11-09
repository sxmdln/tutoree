class TuteesController < ApplicationController

    def index
    end

    def show
        @tutees = Tutee.all
    end

    def new
        @tutee = Tutee.new()
    end

    def edit
    end

    def create
        @tutee = Tutee.new(tutee_params)
        respond_to do |format|
            if @tutee.save
                format.html { redirect_to "/dashboard", notice: "Personal information for tutee is successfully created" }
                # format.json { render :show, status: :created, location: @tutee }
            else
                format.html { render :new, status: :unprocessable_entity }
                # format.json { render json: @tutee.errors, status: :unprocessable_entity }
            end
        end
    end

    def update
    end

    private
        def set_tutee
            @tutor = Tutor.find(params[:id])
        end

    # Only allow a list of trusted parameters through.
        def tutee_params
        params.require(:tutee).permit(
            :first_name, :last_name, :profile_picture, :birthdate, :address, :school_id, :matriculation_form, :is_active, :payment_info,
            # posts_attributes: [:post_name, :post_price, :skill_category, :is_accepted, :date_posted],
            accepted_tutee_attributes: [:status]
        )
        
        end


end
