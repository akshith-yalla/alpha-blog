class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]
  
  def show
  end

  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def new
    @article = Article.new
  end

  def edit
    authorize @article
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:notice] = "Article was created successfully!"
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    authorize @article
    if @article.update(article_params)
      flash[:notice] = "Article was updated successfully!"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    authorize @article
    if @article.destroy
      flash[:notice] = "Article destroyed successfully!"
      redirect_to articles_path
    else
      redirect_to articles_path
    end
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description, category_ids: [])
  end

end