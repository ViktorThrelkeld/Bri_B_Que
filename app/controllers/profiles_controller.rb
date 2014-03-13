class ProfilesController < ApplicationController
  def new

  end

  def create
    profile = current_user.build_profile(profile_params)
    if profile.save
      redirect_to profile_path(profile)
    end
  end

  def show
    @profile = Profile.find(params[:id])
    @recipes = @profile.user.recipes.sort_by_title
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    profile = Profile.find(params[:id])
    profile.update_attributes(profile_params)
    if profile.save
      redirect_to profile_path(profile)
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:bio, :hometown, :age)
  end
end