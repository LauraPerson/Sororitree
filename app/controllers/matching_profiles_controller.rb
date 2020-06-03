class MatchingProfilesController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @request = Request.find(params[:request_id])
    authorize @request
    if @request.age_min.nil? || @request.age_max.nil?
      @helpers = User.where(helper: true)
      @helpers = search_theme(@request.theme_id, @helpers)
    else
      @helpers = search_age(@request.age_min, @request.age_max)
      @helpers = search_theme(@request.theme_id, @helpers)
    end
  end

  def create
    @request = Request.find(params[:request_id])
    authorize @request
    @matching_profile = MatchingProfile.new(request_id: @request.id, user_id: params[:helper_id])
    @matching_profile.save
  end

  private

  def matchingprofile_params
    params.require(:matchingprofile).permit(:request_id, :user_id)
  end

  def search_age(age_min, age_max)
    helpers = User.where(helper: true)
    year_min = DateTime.now().year - age_min.to_i
    year_max = DateTime.now().year - age_max.to_i
    helpers = helpers.where("extract(year from birth_date) <= ?", year_min)
    helpers = helpers.where("extract(year from birth_date) >= ?", year_max)
  end

  def search_theme(theme_id, helpers)
    selected_theme = SelectedTheme.where(theme_id: theme_id)
    theme_helpers = []
    selected_theme.each do |selected_theme|
      theme_helpers << selected_theme.user_id
    end
    helpers = helpers.where(id: theme_helpers)
  end
end
