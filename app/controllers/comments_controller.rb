class CommentsController < ApplicationController
  def create
  	@post = Post.find(params[:post_id])
  	@comment = @post.comments.create(comments_params)

  	flash[:notice] = 'Comment added.'
  	redirect_to post_path(@post)
  end

  private
  	def comments_params
  		params.require(:comment).permit(:name, :email, :body, :post_id)
  	end
end
