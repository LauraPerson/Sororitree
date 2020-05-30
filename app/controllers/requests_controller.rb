class RequestsController < ApplicationController
  before_action :authenticate_user!

  def new
    @request = Request.new()
    authorize @request
  end

  def create
    @request = Request.new(params_request)
    authorize @request
    @request.user = current_user
    @request.save

    if @request.age_min.nil? || @request.age_max.nil?
      @helpers = User.where(helper: true)
      @helpers.each do |helper|
        @matching_profile = MatchingProfile.new(request_id: @request.id, user_id: helper.id)
        @matching_profile.save
      end
    else
      @helpers = search(@request.age_min, @request.age_max)
      @helpers.each do |helper|
        @matching_profile = MatchingProfile.new(request_id: @request.id, user_id: helper.id)
        @matching_profile.save
      end
    end

    if @request.save
      redirect_to request_matching_profiles_path(@request)
    else
      render :new
    end


  end

  private

  def search(age_min, age_max)
    helpers = User.where(helper: true)
    year_min = DateTime.now().year - age_min.to_i
    year_max = DateTime.now().year - age_max.to_i
    helpers = helpers.where("extract(year from birth_date) <= ?", year_min)
    helpers = helpers.where("extract(year from birth_date) >= ?", year_max)
    return helpers
  end

  def params_request
    params.require(:request).permit(:age_min, :age_max, :distance, :theme_id, :user_id)
  end

  def find_request
    @request = Request.find(params[:id])
  end
end
