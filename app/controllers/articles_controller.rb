class ArticlesController < ApplicationController
 
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    unless user_signed_in?
      redirect_to new_session_path 
    end

    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
    unless user_signed_in? && session[:user_id] == @article.owner_id
      redirect_to root_path
      flash[:alert] = "You are not the owner of this Article"
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    unless user_signed_in? && session[:user_id] == @article.owner_id
      redirect_to root_path
      flash[:alert] = "You are not the owner of this Article"
    else

    @article.destroy
    redirect_to root_path, status: :see_other

    end
  end

  private
  def article_params
    params.require(:article).permit(:owner_id,:title,:body,:status)
  end
end
