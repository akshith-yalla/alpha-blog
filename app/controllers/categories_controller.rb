class CategoriesController < ApplicationController
  def index
    @categories = Category.paginate(page: params[:page], per_page: 5)
  end

  def new
    @category = Category.new
    authorize @category
  end

  def show
    @category = Category.find(params[:id])
    @articles = @category.articles.paginate(page: params[:page], per_page: 5)
  end

  def create
    @category = Category.new(category_params)
    authorize @category
    if @category.save
      flash[:notice] = 'Category was successfully created'
      redirect_to @category
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
    authorize @category
  end

  def update
    @category = Category.find(params[:id])
    authorize @category
    if @category.update(category_params)
      flash[:notice] = 'Category was updated successfully'
      redirect_to @category
    else
      render 'edit'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
