class ProfessionalsController < ApplicationController
  before_action :authenticate_user!


  def new
    @professional = Professional.new
    authorize @professional
  end

  def create
    @professional = Professional.new(params_professional)
    authorize @professional
    @professional.user = current_user
    @professional.save
    redirect_to current_user
  end

  def show
    @professional = Professional.find(params[:id])
    authorize @professional
  end

  private

  def params_professional
    params.require(:professional).permit(:description, :job_category)
  end

end
