class Auth::SteamAuthenticator < ::Auth::ManagedAuthenticator
  def name
    'steam'
  end

  def enabled?
    SiteSetting.enable_steam_logins
  end

  def register_middleware(omniauth)
    omniauth.provider :steam, SiteSetting.steam_web_api_key
  end
end
