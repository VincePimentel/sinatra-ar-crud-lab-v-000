
require_relative "../../config/environment"

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, "public"
    set :views, "app/views"
  end

  get "/" do
    @articles = Article.all

    erb :index
  end

  get "/articles/new" do
    erb :new
  end

  post "/articles" do
    Article.create(params)

    erb :show
  end

  get "/articles/:id" do
    @article = Article.find(params[:id])

    erb :show
  end

  get "/articles/:id/edit" do
    @article = Article.find(params[:id])

    erb :edit
  end

  patch "/articles/:id" do
    article = Article.find(params[:id])
    article.title = params[:title]
    article.content = params[:content]
    article.save

    redirect to "/articles/#{params[:id]}"
  end

  delete "articles/:id/delete" do
    Article.delete(params[:id])
  end
end
