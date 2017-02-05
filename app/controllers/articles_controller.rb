class ArticlesController < ApplicationController

  def index
    @articles = Article.all
    # This is what the app will send back when
    # a user requests http://localhost:3000/articles/
    # following the RESTful conventions this should be a
    # list of articles
    #When the router sees this request come in,
    # it tries to call the index action inside
    # articles_contoller
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(params[:id])

    redirect_to article_path(@article)
  end

  def edit
    @article = Article.find(params[:id])

  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    flash.notice = "Article '#{@article.title}' Updated!"

    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])

    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end


end
