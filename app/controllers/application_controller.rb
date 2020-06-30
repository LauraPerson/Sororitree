class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :messages_read
  before_action :profile_matched
  before_action :set_locale

  def messages_read
    @chatrooms_user = Chatroom.where(user: current_user).or(Chatroom.where(guest_user: current_user))
    @unread = Message.where(read: false).where(chatroom: @chatrooms_user).where.not(user: current_user)
  end

  def profile_matched
    # raise
    if current_user
      @profile_matched = 0
      current_user.matching_profiles.each do |match|
        @profile_matched += 1 if match.accepted.nil?        
      end
      @profile_matched
    end
  end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :photo, :nickname, :helper, :birth_date])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :photo, :nickname, :helper, :birth_date])
  end

  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  # def default_url_options
  #   { host: ENV["DOMAIN"] || "localhost:3000" }
  # end

  def default_url_options
    { locale: I18n.locale == I18n.default_locale ? nil : I18n.locale }
  end

  private

  def set_locale
    I18n.locale = params.fetch(:locale, I18n.default_locale).to_sym
  end

  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
