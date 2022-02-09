class CategoriesController < ApplicationController

  def index
  end

  def new
    @category = Category.new
  end

  def show
  end

  def create
    @category = Category.new(categeory_params)
    if @category.save
      flash[:notice] = "Category was successfully created"
      redirect_to @category
    else
      render 'new'
    end
  end

  private
  def categeory_params
    params.require(:category).permit(:name)
  end

end