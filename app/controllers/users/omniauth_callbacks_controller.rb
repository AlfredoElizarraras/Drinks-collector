# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    omniauth_redirection('github')
  end

  def google_oauth2
    omniauth_redirection('google')
  end

  def facebook
    omniauth_redirection('facebook')
  end

  def failure
    redirect_to root_path
  end

  private

  def omniauth_redirection(provider)
    @user = User.from_omniauth(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: provider.capitalize) if is_navigational_format?
    else
      session["devise.#{provider}_data"] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end
end
