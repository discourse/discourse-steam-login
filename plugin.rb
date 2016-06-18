# name: Steam authenticator
# about: Authenticate with Discourse via Steam
# version: 1.2
# author: Jonathan de Faye
# url: https://github.com/defaye/discourse-steam-login

enabled_site_setting :discourse_steam_login_enabled
enabled_site_setting :discourse_steam_login_api_key

require File.expand_path('../lib/omniauth-steam.rb', __FILE__)

register_asset 'stylesheets/plugin.scss'

class SteamAuthenticator < ::Auth::Authenticator
  def name
    'steam'
  end

  def register_middleware(omniauth)
    omniauth.provider :steam, SiteSetting.discourse_steam_login_api_key.present? ?
      SiteSetting.discourse_steam_login_api_key : ENV['STEAM_WEB_API_KEY']
  end

  def after_create_account(user, auth)
    data = auth[:extra_data]
    ::PluginStore.set('steam', "steam_uid_#{data[:steam_uid]}", {user_id: user.id })
  end

  def after_authenticate(auth_token)
    result = Auth::Result.new

    data = auth_token[:info]
    raw_info = auth_token["extra"]["raw_info"]
    steam_uid = auth_token["uid"]

    current_info = ::PluginStore.get('steam', "steam_uid_#{steam_uid}")

    result.user =
      if current_info
        User.where(id: current_info[:user_id]).first
      end

    result.username = data["nickname"]
    result.name = data["name"] # unless profile privacy set to private
    result.extra_data = { steam_uid: steam_uid }

    result
  end
end

auth_provider authenticator: SteamAuthenticator.new,
              title: 'with Steam',
              frame_width: 960,
              frame_height: 800
