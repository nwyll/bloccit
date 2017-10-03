class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]
    
    if @post.save
      flash[:notice] = "Posts was saved."
      redirect_to @post
    else
      flash.now[:alert] = "There was an error saving th post. Please try again."
      render :new
    end
  end

  def edit
  end
end
