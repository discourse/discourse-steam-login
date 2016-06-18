Discourse Steam Login
=====================

1. Add your STEAM WEB API KEY obtainable from [steamcommunity.com/dev/apikey](http://steamcommunity.com/dev/apikey). E.g. domain name: `forum.example.org`

2. SSH into your server.

3. `cd /var/discourse`

4. Open `containers/app.yml` and make the following changes:

  1. Add the API key to your Discourse Docker configuration file located at `/var/discourse/containers/app.yml`. It needs to go under `env:` in the format `  STEAM_WEB_API_KEY: SOMEKEY`

  2. Add the git clone of this plugin to the plugin list under `hooks:` below the Discourse Docker Manager plugin like so: `- git clone https://github.com/defaye/discourse-steam-login.git`

  3. Exit and save changes

5. Run `./launcher rebuild app` to apply the changes.

6. You're done! Please consider starring [my repository][1] if you use github. The more attention it gets, the more I will give back to it.

7. Please ask well-formed, well-written questions at the [meta.discourse.org page][2]. If you think there is a bug, then go to some effort to prove it if you intend to open an issue, or I will not take you seriously.

[1]:https://github.com/defaye/discourse-steam-login
[2]:https://meta.discourse.org/t/steam-login-authentication-plugin/18153
