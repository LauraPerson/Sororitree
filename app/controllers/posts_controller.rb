class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:query]
      @search = params[:query]
      @posts = policy_scope(Post.search_by_content(params[:query]) || Post.search_by_theme(params[:query]))
      authorize @posts
      @post = Post.new()
      authorize @post
    else
      @posts = policy_scope(Post)
      authorize @posts
      @post = Post.new()
      authorize @post
    end
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

  def my_posts
    @posts = Post.where(user_id: current_user.id)
    authorize @posts
    @post = Post.new()
    authorize @post
  end

  private

  def params_posts
    params.require(:post).permit(:user_id, :theme_id, :content)
  end


end
