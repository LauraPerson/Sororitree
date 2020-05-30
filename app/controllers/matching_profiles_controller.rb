class MatchingProfilesController < ApplicationController
  before_action :authenticate_user!

  def index
    @request = Request.find(params[:request_id])
    @matching_profiles = policy_scope(MatchingProfile.where(request: @request))
  end

  def create
  end

  private

  def matchingprofile_params
    params.require(:matchingprofile).permit(:request_id, :user_id)
  end
end
