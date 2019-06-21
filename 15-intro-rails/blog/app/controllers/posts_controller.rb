class PostsController < ApplicationController

  get '/posts' do
    @posts = Post.all
    erb :"/posts/index"
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :"/posts/show"
  end
end
