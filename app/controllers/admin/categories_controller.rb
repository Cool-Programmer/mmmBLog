class Admin::CategoriesController < Admin::ApplicationController
  def new
    @page_title = 'Vlog | Add Category'
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = 'Category created successfully'
      redirect_to admin_categories_path
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:notice] = 'Category updated successfully'
      redirect_to admin_categories_path
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      flash[:notice] = 'Category removed successfully'
      redirect_to admin_categories_path
    else
      render 'index'
    end
  end

  def index
    @categories = Category.all
  end

  private 
    def category_params
      params.require(:category).permit(:name)      
    end
end
