class SessionsController < ApplicationController
  def create
    redbooth = Redbooth.(ENV['REDBOOTH_CLIENT_ID'],
              ENV['REDBOOTH_CLIENT_SECRET'],
              access_token,
              refresh_token)
    user = User.find_by_token_and_refresh_token(redbooth.token, redbooth.refresh_token) || User.create_with_redbooth_authorization(redbooth.token, redbooth.refresh_token)
    redirect_to root_path, notice: 'Signed in with Redbooth'
  end

  private

  def access_token
    @access_token = omniauth_auth['credentials']['token']
  end

  def refresh_token
    @refresh_token = omniauth_auth['credentials']['refresh_token']
  end

  def omniauth_auth
    request.env['omniauth.auth']
  end
end
