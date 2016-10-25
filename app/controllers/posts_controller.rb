class PostsController < ApplicationController
	
	def new
	end

	def create
		post = current_user
						.posts
						.create(post_params)

		if post.valid?
        redirect_to current_user
    else
        flash[:error] = "post didn't save correctly"
        redirect_to :back
    end
  end

	def show
		@user = User.find(params[:id])
	end

	private

	def post_params
			params.require(:post).permit(:title, :post_text)
	end

end
