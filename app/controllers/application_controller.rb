
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to "/articles"
  end

  get '/articles' do
    erb :index
  end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
      @new_article = Article.create(params)
      redirect to "/articles/#{@new_article.id}"
  end

  get '/articles/:id' do
   @new_article = Article.find(params[:id])
   erb :show
  end

  get '/articles/:id/edit' do
    @new_article = Article.find(params[:id])
    erb :edit
  end

  patch "/articles/:id" do
    @new_article = Article.find(params[:id])
    @new_article.update(title: params[:title], content: params[:content])
    redirect to "/articles/#{@new_article.id}"
  end


  delete "/articles/:id" do
    Article.destroy(params[:id])
    redirect to "/articles"
  end

end
