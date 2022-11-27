class PostsController < ApplicationController
    
    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
    end

    def create_post
		@post = Post.new(post_params)
        @post.is_accepted = false
        @user = User.find(session[:user_id])
        @post.author_id = @user._id
        
        respond_to do |format|
            if @post.save
                format.html { redirect_to "/dashboard", notice: "Post was successfully created." }
                # format.json { render :show, status: :created, location: @post }
            else
                format.html { render :new, status: :unprocessable_entity }
                # format.json { render json: @post.errors, status: :unprocessable_entity }
            end
        end
	end
    

    def apply
        apply_post = Post.find(params[:id])
        @accepted_tutee = AcceptedTutee.new()

        if apply_post.is_accepted == false then
            apply_post.is_accepted = true
            @accepted_tutee.tutee_id = apply_post.author_id
            @accepted_tutee.tutor_id = session[:user_id]
            @accepted_tutee.name = apply_post.post_name
            @accepted_tutee.price = apply_post.post_price
            @accepted_tutee.date_duration = apply_post.date_duration
        end
        apply_post.save
        respond_to do |format|
            if @accepted_tutee.save
                    format.html { redirect_to "/dashboard", notice: "Accepted Tutee success." }
                    # format.json { render :show, status: :created, location: @post }
            else
                    format.html { redirect_to "/dashboard", notice: "Accepted Tutee NOT a success." }
                    format.json { render json: @post.errors, status: :unprocessable_entity }
            end
        end
    end
    private
        def post_params
            params.require(:post).permit(:author_id, :post_name, :post_price, :skill_category, :is_accepted, :date_posted, :date_duration)
        end
end