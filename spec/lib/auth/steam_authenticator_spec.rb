# frozen_string_literal: true

describe Auth::SteamAuthenticator do
  describe "#enabled?" do
    subject(:authenticator) { described_class.new }

    it "requires configured credentials and the login toggle" do
      SiteSetting.steam_web_api_key = "api_key"
      expect(authenticator.enabled?).to eq(false)

      SiteSetting.enable_steam_logins = true
      expect(authenticator.enabled?).to eq(true)

      SiteSetting.steam_web_api_key = ""
      expect(authenticator.enabled?).to eq(false)
    end

    it "rejects enabling login without an API key" do
      expect { SiteSetting.enable_steam_logins = true }.to raise_error(Discourse::InvalidParameters)
    end
  end

  describe "#can_revoke?" do
    it "should be false be default" do
      authenticator = Auth::SteamAuthenticator.new

      expect(authenticator.can_revoke?).to eq(false)
    end

    it "should be true when steam_logins_allow_revoke site settings is enabled" do
      SiteSetting.steam_logins_allow_revoke = true

      authenticator = Auth::SteamAuthenticator.new

      expect(authenticator.can_revoke?).to eq(true)
    end
  end
end
