class MatchingProfilesController < ApplicationController
  before_action :authenticate_user!

  def index
    @matching_profiles = policy_scope(MatchingProfile)
  end

end
