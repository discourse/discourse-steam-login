# frozen_string_literal: true

class Auth::SteamAuthenticator < ::Auth::ManagedAuthenticator
  def name
    'steam'
  end

  def enabled?
    SiteSetting.enable_steam_logins
  end

  def can_revoke?
    SiteSetting.steam_logins_allow_revoke
  end

  def register_middleware(omniauth)
    omniauth.provider :steam, setup: lambda { |env|
      strategy = env["omniauth.strategy"]
      strategy.options[:api_key] = SiteSetting.steam_web_api_key
    }
  end
end
