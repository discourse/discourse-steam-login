Discourse Steam Login
=====================

1. SSH into your server and edit your Discourse Docker configuration file (e.g. `nano /var/discourse/containers/app.yml`) and make the following changes:

    * Add a `git clone` of this repository to the plugin list under `hooks:` below the Discourse Docker Manager plugin like so: `- git clone https://github.com/defaye/discourse-steam-login.git`.


2. Check the [validity][4] of your file if you must. Then exit and save changes. (E.g. `ctrl + x, y, enter`)

3. Run the rebuild script to apply the changes (e.g. `/var/discourse/launcher rebuild app`).

4. Acquire your STEAM WEB API KEY obtainable from [steamcommunity.com/dev/apikey](http://steamcommunity.com/dev/apikey) (example domain name: `forum.example.org`). Login to your *admin* account and go to: *Plugins* &mdash; *Steam authenticator* &mdash; and save your key in the `discourse steam login api key` field.

5. You're done! You should now be able to login via Steam. Please consider starring [my repository][1] if you use github. The more stars it receives, the more [TLC][3] and time I will spend in maintaining it.


Bugs
----

Please ask well-formed, well-written questions at the [meta.discourse.org page][2]. If you think there is a bug, **prove it** in an issue *or do not open one*. This may come across as blunt but it really does need to be quite explicit or otherwise these instructions will be ignored and you will waste my time.


Troubleshooting
---------------
For backwards compatibility with versions `< 1.3.0`, the plugin will default to the environment variable `STEAM_WEB_API_KEY` if no key is found in the plugin's site setting.

If you are setting up discourse for the first time or are able to re-build the app, you can set the API KEY at runtime under `env:` section of your configuration file in the format `  STEAM_WEB_API_KEY: 'YOURKEY'`.

If you are not using docker and do not have access to admin (and have somehow managed to only permit Steam login (you are cool by the way)), you might be able to redeem the situation by setting the environment variable manually in your server (e.g `export STEAM__WEB_API_KEY=YOURKEY`).


[1]:https://github.com/defaye/discourse-steam-login
[2]:https://meta.discourse.org/t/steam-login-authentication-plugin/18153
[3]:https://en.wiktionary.org/wiki/tender_loving_care
[4]:http://www.yamllint.com/
