Doorkeeper.configure do
  orm :active_record

  resource_owner_authenticator do
    @user = env[:clearance].current_user

    unless @user
      session[:return_to] = request.fullpath
      redirect_to(sign_in_url)
    end

    @user
  end

  resource_owner_from_credentials do |routes|
    User.authenticate(params[:username], params[:password])
  end
end
Doorkeeper.configuration.token_grant_types << "password"
