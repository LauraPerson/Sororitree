class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    super
  end

  def edit
    super
  end

  def update
    super
  end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  protected

  def after_sign_up_path_for(resource)
    new_profile_avatar_path 
  end

  def after_update_path_for(resource)
    user_path(resource)
  end
end 