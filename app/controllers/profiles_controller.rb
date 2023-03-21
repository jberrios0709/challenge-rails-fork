class ProfilesController < ApplicationController
  before_action :params_permit, only: [:create]

  def create
    @profile = Profile.new(params_permit)
    return render :new, status: :unprocessable_entity unless @profile.save

    redirect_to profile_path(@profile.id)
  end

  def new
    @profile = Profile.new
  end

  def show
    @profile = Profile.find(params[:id])
  end

  private

  def params_permit
    params.require(:profile).permit(:username)
  end
end
