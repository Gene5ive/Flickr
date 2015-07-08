class DashboardController < ApplicationController
  def index
    @user = current_user
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "You have successfully updated your photo."
      redirect_to dashboard_path
    else
      flash[:notice] = "Bummer. Your photo didn't update."
      redirect_to dashboard_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:avatar)
  end
end
