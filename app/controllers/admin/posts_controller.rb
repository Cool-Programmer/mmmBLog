class Admin::PostsController < Admin::ApplicationController

  before_filter :verify_logged_in

  def new
    @post_title = 'Add Post'
    @post = Post.new
    @category = Category.new
    @user = User.new
  end

  def create
    @post = Post.new(post_params)

    if params[:post][:image].blank?
      @post.image = nil  
    end
    
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
    
    if params[:post][:image].blank?
      @post.image = nil  
    end
    
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
    if params[:search]
        @posts = Post.search(params[:search]).all.order('created_at DESC').paginate(:page => params[:page], :per_page => 10)
    else
        @posts = Post.all.order('created_at DESC').paginate(:page => params[:page], :per_page => 10)
    end
    
  end

  def show
  end

  private 
  def post_params
    params.require(:post).permit(:title, :category_id, :user_id, :image, :tags, :body)
  end
end
