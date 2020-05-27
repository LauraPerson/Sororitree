class SelectedThemesController < ApplicationController
  before_action :authenticate_user!

  def create
    params.require(:selected_theme).require(:theme_id).each do |theme|
      @selected_theme = SelectedTheme.new(theme_id: theme)
      @selected_theme.user = current_user
      authorize @selected_theme
      @selected_theme.save
    end
    redirect_to user_path(current_user)
  end

  def update
  end

  private

  def params_selected_themes
    params.require(:selected_theme).require(:theme_id)
  end
end
