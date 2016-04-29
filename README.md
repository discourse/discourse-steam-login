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

6. You're done! Please consider starring [my repository][1] as it gives me some feedback on whether this is well received. This will encourage me to find more time to improve the plugin and enhance it in the future.

[1]:https://github.com/defaye/discourse-steam-login
