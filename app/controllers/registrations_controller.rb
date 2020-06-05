class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    super
  end

  def update
    super
  end

  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  protected

  def after_update_path_for(resource)
    user_path(resource)
  end
end 