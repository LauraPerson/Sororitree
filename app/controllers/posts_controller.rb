class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = policy_scope(Post)
    authorize @posts
  end

  def create
    @post = Post.new(params_posts)
    authorize @post
    if @post.save
      # redirect_to
    else
      render '/posts'
    end
  end

  private

  def params_posts
    params.require(:post).permit(:user_id, :theme_id, :content)
  end


end
