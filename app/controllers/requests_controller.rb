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
      # redirect_to matching_profile
    else
      render :new
    end
  end

  private

  def params_request
    params.require(:request).permit(:age, :distance, :theme_id, :user_id)
  end
end
