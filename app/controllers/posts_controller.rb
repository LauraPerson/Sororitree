class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: [:edit, :update, :destroy]

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

  def edit
    authorize @post
  end

  def update
    @post.update(params_posts)
    authorize @post
    redirect_to my_posts_posts_path
  end

  def destroy
    authorize @post
    @post.destroy
    redirect_to my_posts_posts_path
  end

  private

  def params_posts
    params.require(:post).permit(:user_id, :theme_id, :content)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
