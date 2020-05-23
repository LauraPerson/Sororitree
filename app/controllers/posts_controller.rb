class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = policy_scope(Post)
    authorize @posts
    @post = Post.new()
    authorize @post
  end

  def create
    @post = Post.new(params_posts)
    authorize @post
    @post.user = current_user
    if @post.save!
      redirect_to posts_path
    else
      render :index
    end
  end

  private

  def params_posts
    params.require(:post).permit(:user_id, :theme_id, :content)
  end


end
