class PagesController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @posts = Post.all
    authorize @posts
    @random_posts = []
    (1..3).each do
      random = rand(1..Post.count).to_i
      @random_posts << Post.find(random)
    end
  end
end
