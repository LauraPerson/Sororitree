class RequestsController < ApplicationController
  before_action :authenticate_user!

  def new
    @request = Request.new()
    authorize @request
  end

  def create
    @request = Request.new(params_request)
    authorize @request
    if @request.save
      #redirect_to request_matching_profile_path
    else
      render :new
    end
  end

  private

  def search(age_min, age_max)
    helpers = User.where(helper: true)
    year_min = DateTime.now().year - age_min
    year_max = DateTime.now().year - age_max
    helpers = helpers.where("extract(year from birth_date) >= ?", year_min)
    helpers = helpers.where("extract(year from birth_date) >= ?", year_max)
  end

  def params_request
    params.require(:request).permit(:age_min, :age_max, :distance, :theme_id, :user_id)
  end
end
