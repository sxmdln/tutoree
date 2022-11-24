class PostsController < ApplicationController
    
    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
        @accepted_tutee = AcceptedTutee.new
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
        @accepted_tutee = AcceptedTutee.new(accepted_tutee_params)

        if apply_post.is_accepted == false then
            apply_post.is_accepted = true
            @accepted_tutee.tutee_id = apply_post.author_id
            # @accepted_tutee.name = apply_post.post_name
            # @accepted_tutee.price = apply_post.post_price
        end
        apply_post.save
        if @accepted_tutee.save
                format.html { redirect_to "/dashboard", notice: "Accepted Tutee success." }
                # format.json { render :show, status: :created, location: @post }
        else
                format.html { render :new, status: :unprocessable_entity }
                # format.json { render json: @post.errors, status: :unprocessable_entity }
        end
    end

    private
        def post_params
            params.require(:post).permit(:author_id, :post_name, :post_price, :skill_category, :is_accepted, :date_posted)
        end

        def accepted_tutee_params
            params.require(:accepted_tutee).permit(:tutee_id,:name,:price)
        end
end