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

    if @request.save
      redirect_to new_request_matching_profile_path(@request)
    else
      render :new
    end

  end

  private

  def params_request
    params.require(:request).permit(:age_min, :age_max, :distance, :theme_id, :user_id)
  end

  def find_request
    @request = Request.find(params[:id])
  end
end
