class PostsController < ApplicationController
  def index
    posts = Post.all
    render json: posts
  end

  def create
    post = Object.new(post_params)
    object.save
    redirect_to object
  end

  def show
    post = Post.find(params[:id])
    render json: post
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    render json: post
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    render json: post
  end
  
  
  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

end
