class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    authorize current_user
    @user = User.find(params[:id])
    @selected_theme = SelectedTheme.new()
  end

  def update
    authorize current_user
    current_user.update(params_user)
    redirect_to user_path(current_user)
  end

  private

  def params_user
    params.require(current_user).permit(:selected_theme_id, :nickname, :email, :password)
  end
end
