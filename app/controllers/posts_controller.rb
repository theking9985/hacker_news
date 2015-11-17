class PostsController < ApplicationController
  def index
  	@posts = Post.find(params[:user_id]).all
  end

  def new
  	@user = User.new
  end

  def create
  	User.create user_params
  	redirect_to 
  end
end
