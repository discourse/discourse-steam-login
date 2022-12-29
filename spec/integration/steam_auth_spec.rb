# frozen_string_literal: true

describe "Steam OpenID 2.0" do
  let(:web_api_key) { "abcdef11223344" }
  let(:steam_user_id) { "894923402340234" }

  before do
    # jack up OpenID logger min severity to remove noisy info messages
    OpenID::Util.logger.level = 100
    SiteSetting.steam_web_api_key = web_api_key
    SiteSetting.enable_steam_logins = true

    cert = OpenSSL::X509::Certificate.new
    cert.add_extension(OpenSSL::X509::Extension.new("subjectAltName", "DNS:steamcommunity.com"))
    StubSocket::StubIO.any_instance.stubs(:peer_cert).returns(cert)

    stub_request(:get, "http://steamcommunity.com/openid").to_return(
      status: 200,
      body: <<~XML,
          <?xml version="1.0" encoding="UTF-8"?>
          <xrds:XRDS xmlns:xrds="xri://$xrds" xmlns="xri://$xrd*($v*2.0)">
            <XRD>
              <Service priority="0">
                <Type>http://specs.openid.net/auth/2.0/signon</Type>
                <URI>https://steamcommunity.com/openid/login</URI>
              </Service>
            </XRD>
          </xrds:XRDS>
        XML
      headers: {
        "Content-Type" => "text/xml",
      },
    )
    stub_request(:post, "https://steamcommunity.com/openid/login").to_return(
      status: 200,
      body: <<~BODY,
          ns:http://specs.openid.net/auth/2.0
          is_valid:true
        BODY
      headers: {
        "Content-Type" => "text/plain",
      },
    )
    stub_request(:get, "https://steamcommunity.com/openid/id/#{steam_user_id}").to_return(
      status: 200,
      body: <<~BODY,
          <?xml version="1.0" encoding="UTF-8"?>
          <xrds:XRDS xmlns:xrds="xri://$xrds" xmlns="xri://$xrd*($v*2.0)">
            <XRD>
              <Service priority="0">
                <Type>http://specs.openid.net/auth/2.0/signon</Type>
                <URI>https://steamcommunity.com/openid/login</URI>
              </Service>
            </XRD>
          </xrds:XRDS>
        BODY
    )
    stub_request(
      :get,
      "https://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=#{web_api_key}&steamids=#{steam_user_id}",
    ).with(headers: { "Host" => "api.steampowered.com" }).to_return(
      status: 200,
      body:
        JSON.dump(
          response: {
            players: [
              {
                steamid: steam_user_id,
                communityvisibilitystate: 3,
                profilestate: 1,
                personaname: "SteamyPlayer",
                profileurl: "https://steamcommunity.com/id/SteamyPlayer/",
                avatar:
                  "https://avatars.akamai.steamstatic.com/734096e84a118c839422fa213faa6885c093374d.jpg",
                avatarmedium:
                  "https://avatars.akamai.steamstatic.com/734096e84a118c839422fa213faa6885c093374d_medium.jpg",
                avatarfull:
                  "https://avatars.akamai.steamstatic.com/734096e84a118c839422fa213faa6885c093374d_full.jpg",
                avatarhash: "734096e84a118c839422fa213faa6885c093374d",
                lastlogoff: 1_659_365_725,
                personastate: 0,
                primaryclanid: "103588791859221341",
                timecreated: 1_524_883_291,
                personastateflags: 0,
              },
            ],
          },
        ),
    )
  end

  it "retrieves user details from the Steam API after the authentication flow is complete" do
    post "/auth/steam"
    expect(response.status).to eq(303)
    expect(response.location).to start_with("https://steamcommunity.com/openid/login")

    post "/auth/steam/callback",
         params: {
           _method: "post",
           "openid.ns": "http://specs.openid.net/auth/2.0",
           "openid.mode": "id_res",
           "openid.op_endpoint": "https://steamcommunity.com/openid/login",
           "openid.claimed_id": "https://steamcommunity.com/openid/id/#{steam_user_id}",
           "openid.identity": "https://steamcommunity.com/openid/id/#{steam_user_id}",
           "openid.return_to": "http://test.localhost/auth/steam/callback?_method=post",
           "openid.response_nonce": "#{1.minute.ago.iso8601}aZq7eHv92/2Mg4OsPKiKcTgI0j4=",
           "openid.assoc_handle": "1234567890",
           "openid.signed":
             "signed,op_endpoint,claimed_id,identity,return_to,response_nonce,assoc_handle",
           "openid.sig": "ZseI1sqVHGU/f5Ye7Tcn7T3QMIg=",
         }
    expect(response.status).to eq(302)
    expect(response.location).to eq("http://test.localhost/")
    expect(session[:current_user_id]).to be_blank

    authentication_data = JSON.parse(cookies[:authentication_data]).deep_symbolize_keys!
    expect(authentication_data[:email]).to be_blank
    expect(authentication_data[:username]).to eq("SteamyPlayer")
    expect(authentication_data[:email_valid]).to eq(false)
  end
end
