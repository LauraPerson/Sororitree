class PagesController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @posts = Post.all
    authorize @posts
    random = [rand(1..Post.count), rand(1..Post.count), rand(1..Post.count)]
    @random_posts = Post.includes(user: :avatar).find(random)
  end
end
