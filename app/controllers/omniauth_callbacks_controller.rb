class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # replace with your authenticate method
  skip_before_action :authenticate_user!, raise: false

  def google_oauth2
    auth = request.env["omniauth.auth"]
    user = User.where(provider: auth["provider"], uid: auth["uid"])
            .first_or_initialize(email: auth["info"]["email"])
    user.password = SecureRandom.urlsafe_base64
    user.save!

    user.remember_me = true
    sign_in(:user, user)

    redirect_to after_sign_in_path_for(user)
  end

  def facebook
    auth = request.env["omniauth.auth"]
    user = User.where(provider: auth["provider"], uid: auth["uid"])
            .first_or_initialize(email: auth["info"]["email"], name: auth["info"]["firts_name"])
    user.password = SecureRandom.urlsafe_base64
    user.save!

    user.remember_me = true
    sign_in(:user, user)

    redirect_to after_sign_in_path_for(user)
  end

end
