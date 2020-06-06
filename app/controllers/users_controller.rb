class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    authorize current_user
    @user = User.find(params[:id])
    @selected_theme = SelectedTheme.new
    @selected_themes_existing = SelectedTheme.includes(:theme).where(user_id: current_user.id)
    @professional = Professional.new
    array_existing_theme = []
    @selected_themes_existing.each do |select_theme|
      array_existing_theme << select_theme.theme_id
    end
    @themes = Theme.where.not(id: array_existing_theme)
    @themes == nil ? Theme.all : @themes
  end

  def toggle_helper
    authorize current_user
    current_user.toggle! (:helper)
    redirect_to user_path(current_user)
  end

  def destroy_photo
    authorize current_user
    current_user.photo.purge
    redirect_to edit_user_registration_path(current_user)
  end

  # def toggle_professional
  #   authorize current_user
  #   current_user.toggle! (:professional_status)
  #   redirect_to user_path(current_user)
  # end

  private

  def params_user
    params.require(:user).permit(:selected_theme_id, :nickname, :email, :password, :helper, :professional)
  end
end
