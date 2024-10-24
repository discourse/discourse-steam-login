# -*- encoding: utf-8 -*-
# stub: omniauth-openid 2.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "omniauth-openid".freeze
  s.version = "2.0.1".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Michael Bleigh".freeze, "Erik Michaels-Ober".freeze, "Tom Milewski".freeze]
  s.date = "2021-01-19"
  s.description = "OpenID strategy for OmniAuth.".freeze
  s.email = ["michael@intridea.com".freeze, "sferik@gmail.com".freeze, "tmilewski@gmail.com".freeze]
  s.homepage = "https://github.com/intridea/omniauth-openid".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.5.6".freeze
  s.summary = "OpenID strategy for OmniAuth.".freeze

  s.installed_by_version = "3.5.6".freeze if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<omniauth>.freeze, [">= 1.0".freeze, "< 3.0".freeze])
  s.add_runtime_dependency(%q<rack-openid>.freeze, ["~> 1.4.0".freeze])
end
