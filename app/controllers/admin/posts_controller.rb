class Admin::PostsController < Admin::ApplicationController
  def new
    @post_title = 'Add Post'
    @post = Post.new
    @category = Category.new
    @user = User.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = 'Post created successfully'
      redirect_to admin_posts_path
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = 'Post updated successfully'
      redirect_to admin_posts_path
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = 'User deleted successfully'
      redirect_to admin_posts_path
    else
      render 'index'
    end
  end

  def index
    @posts = Post.all
  end

  def show
  end

  private 
  def post_params
    params.require(:post).permit(:title, :category_id, :user_id, :image, :tags, :body)
  end
end
