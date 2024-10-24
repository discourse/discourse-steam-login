# Changelog

## 2.9.2

* Perform all checks before verifying endpoints.
  [#126](https://github.com/openid/ruby-openid/pull/126)

## 2.9.1

* Updated CHANGELOG.md

## 2.9.0

* Remove deprecated `autorequire` from gemspec.
  [#123](https://github.com/openid/ruby-openid/pull/123)
* Rescue from `Yadis::XRI::XRIHTTPError` on discovery.
  [#106](https://github.com/openid/ruby-openid/pull/106)
* Avoid SSRF for claimed_id request.
  [#121](https://github.com/openid/ruby-openid/pull/121)
* Updated documentation.
  [#115](https://github.com/openid/ruby-openid/pull/115), [#116](https://github.com/openid/ruby-openid/pull/116), [#117](https://github.com/openid/ruby-openid/pull/117), [#118](https://github.com/openid/ruby-openid/pull/118)
* Reduce warnings output in test runs.
  [#119](https://github.com/openid/ruby-openid/pull/119)
* Drop deprecated option from gemspec.
  [#120](https://github.com/openid/ruby-openid/pull/120)
* Remove circular require.
  [#113](https://github.com/openid/ruby-openid/pull/113)
* Updated Travis CI config with Ruby 2.6
  [#114](https://github.com/openid/ruby-openid/pull/114)
* Simplify Bundler require; remove need for extra `:require`.
  [#112](https://github.com/openid/ruby-openid/pull/112)

## 2.8.0

* Fix `admin/mkassoc` script.
  See https://github.com/openid/ruby-openid/pull/103
* Allow specifying timeout for `OpenID::StandardFetcher` in environment variables.
  See https://github.com/openid/ruby-openid/pull/109
* Fixed some documentation.
  See https://github.com/openid/ruby-openid/pull/111
* Fixed example server.
  See https://github.com/openid/ruby-openid/pull/91
* Fixed tests.
  See https://github.com/openid/ruby-openid/pull/86
* Misc. changes to the CI setup.
  See
  - https://github.com/openid/ruby-openid/pull/110
  - https://github.com/openid/ruby-openid/pull/108
  - https://github.com/openid/ruby-openid/pull/107

## 2.7.0

* Use RFC 2396 compatible URI parser for trustroot - 7c84ec9ced3ccbdad575e02dbfa81e53b52f909e
  See https://github.com/openid/ruby-openid/pull/85
* Use HMAC from OpenSSL rather than Digest - ce2e30d7ff3308f17ef7d8c19d6f4752f76c9c40
  See https://github.com/openid/ruby-openid/pull/84
* Check if OpenSSL is loaded - 751e55820d958ee781f5abb466a576d83ddde6fd

## 2.6.0

* More safely build filenames - 1c4a90630b183e7572b8ab5f2e3a3e0c0fecd2c7
  See https://github.com/openid/ruby-openid/pull/80
* The session serializer of Rails4.1 is json - b44a1eb511dec3be25a07930121bc80cacec0f1c
* Handle boolean value to fix signature issue - d65076269b77754da7db6e4b189edeeb9201600d
  See https://github.com/openid/ruby-openid/pull/76

## 2.5.0

* Revert json serialization - 8dc60e553369df2300ebb4b83a29618aff643c2c
  See https://github.com/openid/ruby-openid/pull/73

## 2.4.0

* Allow expecting a parameter to be nil during return_to verification - 708e992ab3e6c26d478283fc11faa6a0a74bfec0
* Serialize to objects that can be stored as json - db1d8f7b171a333dec4e861fe0fa53ac1d98b188
* Fixed missing XRDS HTTP header in sample provider - dc15fa07fd59fdcf46d659cce34c6ef7a6768fde

## 2.3.0

* Deprecated Ruby 1.8 support - 0694bebc83de0313cfef73a5d0ffd9a293ae71a0
* Fixed encoding errors in test suite - 7ac8e3978f9c733bd5ee8d6b742b515b5427ded2
* Be aware when using Hash or Array as default value for unknown Hash keys - #58
* Stop overwriting String#starts_with? and String#ends_with? if defined - #55
* Ignore Associations For OpenID2 (Google's Security Bug Fix) - #53
* Change "oauth" to "ui" in variable name in the UI extension - #52
* Eliminating runtime warnings - #50 #56
* Upgrade example Rails provider/consumer app to Rails 3 - #49

## 2.2.3

* Fixed 'invalid byte sequence in UTF-8' error in parse_link_attrs - 0f46921a97677b83b106366c805063105c5e9f20
* Fixed license information in gemspec - f032e949e1ca9078ab7508d9629398ca2c36980a
* Update starts/ends_with? to handle nil prefix - beee5e8d1dc24ad55725cfcc720eefba6bdbd279

## 2.2.2

* Limit fetching file size & disable XML entity expansion - be2bab5c21f04735045e071411b349afb790078f

  Avoid DoS attack to RPs using large XRDS / too many XML entity expansion in XRDS.

## 2.2.1

* Make bundle exec rake work - 2100f281172427d1557ebe76afbd24072a22d04f
* State license in gemspec for automated tools / rubygems.org page - 2d5c3cd8f2476b28d60609822120c79d71919b7b
* Use default-external encoding instead of ascii for badly encoded pages - a68d2591ac350459c874da10108e6ff5a8c08750
* Colorize output and reveal tests that never ran - 4b0143f0a3b10060d5f52346954219bba3375039

## 2.2.0

* Bundler compatibility and bundler gem tasks - 72d551945f9577bf5d0e516c673c648791b0e795
* register_namespace_alias for AX message - aeaf050d21aeb681a220758f1cc61b9086f73152
* Fixed JRuby (1.9 mode) incompatibilty - 40baed6cf7326025058a131c2b76047345618539
* Added UI extension support - a276a63d68639e985c1f327cf817489ccc5f9a17
* Add attr_reader for setup_url on SetupNeededResponse - 75a7e98005542ede6db3fc7f1fc551e0a2ca044a
* Encode form inputs - c9e9b5b52f8a23df3159c2387b6330d5df40f35b
* Fixed cleanup AR associations whose expiry is past, not upcoming - 2265179a6d5c8b51ccc741180db46b618dd3caf9
* Fixed issue with Memcache store and Dalli - ef84bf73da9c99c67b0632252bf0349e2360cbc7
* Improvements to ActiveRecordStore's gc rake task - 847e19bf60a6b8163c1e0d2e96dbd805c64e2880
