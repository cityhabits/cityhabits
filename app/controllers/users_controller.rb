class UsersController < ApplicationController
  # before_filter :authenticate_user!
  # after_action :verify_authorized

  def show
    @user = User.find(params[:id])
  end

  private

  def secure_params
    params.require(:user).permit(:role)
  end

end
