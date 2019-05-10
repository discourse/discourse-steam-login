class EnableSteamLoginsValidator
  def initialize(opts = {})
    @opts = opts
  end

  def valid_value?(val)
    return true if val == 'f'
    return false if SiteSetting.steam_web_api_key.blank?
    true
  end

  def error_message
    if SiteSetting.steam_web_api_key.blank?
      return I18n.t('site_settings.errors.steam_web_api_key_is_empty')
    end
  end
end
