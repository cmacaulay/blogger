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

end
