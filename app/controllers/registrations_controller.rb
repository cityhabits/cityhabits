class RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def update


    # For Rails 4
    account_update_params = devise_parameter_sanitizer.sanitize(:account_update)

    # render text: account_update_params

    # required for settings form to submit when password is left blank
    if account_update_params[:password].blank?
      account_update_params.delete("password")
      account_update_params.delete("password_confirmation")
    end

    @user = User.find(current_user.id)
    if @user.update_attributes(account_update_params)
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case their password changed
      sign_in @user, :bypass => true
      redirect_to @user
    else
      render "edit"
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:name, :bio, :avatar, :email, :password, :password_confirmation)
    end

    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:name, :bio, :avatar, :email, :password, :password_confirmation)
    end
  end

  def after_sign_up_path_for(resource)
    home_index_path
  end
end
