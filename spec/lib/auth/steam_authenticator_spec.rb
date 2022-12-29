# frozen_string_literal: true

describe Auth::SteamAuthenticator do
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
