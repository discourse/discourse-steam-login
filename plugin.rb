# name: Steam authentication with Discourse
# about: Authenticate with Discourse with Steam
# version: 1.1.1
# author: J. de Faye
# template author: S. Saffron

require File.expand_path('../omniauth-steam.rb', __FILE__)

class SteamAuthenticator < ::Auth::Authenticator

  def name
    'steam'
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

    retrieve_avatar(result.user, data["image"])

    result
  end

  def retrieve_avatar(user, image_url)
    return unless user
    return unless image_url
    return if user.user_avatar.try(:custom_upload_id).present?

    Jobs.enqueue(:download_avatar_from_url, url: image_url, user_id: user.id, override_gravatar: true)
  end

  def after_create_account(user, auth)
    data = auth[:extra_data]
    ::PluginStore.set('steam', "steam_uid_#{data[:steam_uid]}", {user_id: user.id })
  end

  def register_middleware(omniauth)
    omniauth.provider :steam, ENV['STEAM_WEB_API_KEY']
  end

end

auth_provider title: 'with Steam',
    message: 'Sign in via Steam (Make sure pop up blockers are not enabled).',
    frame_width: 960,
    frame_height: 800,
    authenticator: SteamAuthenticator.new

register_css <<CSS

.btn-social.steam {
    background: #000;
}

.btn-social.steam:before {
    content: $fa-var-steam;
}

CSS
