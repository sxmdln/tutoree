class PostsController < ApplicationController
    
    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
        @users = @post.users
    end

    def new
        @post = Post.new
    end

    def create_post
		@post = Post.new(post_params, user_id: @post.user._id)

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

    private
        def set_post
            @post = Post.find(params[:id])
        end

        def post_params
            params.require(:post).permit(:post_name, :post_price, :skill_category, :is_accepted, :date_posted)
        end
    end

end
