class SessionController < ApplicationController

def create
    @user = User.find_or_initialize_by(email: user_info[:email])

    @user.auth_providers.find_or_initialize_by(uid: auth_hash[:uid],
                                 provider: auth_hash[:provider])


    @user.full_name = user_info[:name]
    @user.email = user_info[:email]
    @user.avatar = user_info[:image]
    @user.save

    sign_in(@user)
    redirect_to root_path, notice: 'Wellcome from FB!'
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end

  def user_info
    auth_hash[:info]
  end
end