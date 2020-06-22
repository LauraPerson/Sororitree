class RegistrationsController < Devise::RegistrationsController

  def new
    super
  end

  def create
    build_resource(sign_up_params)
    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_to do |format|
        format.js { render 'pages/home' }
      end
    end
    # super
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