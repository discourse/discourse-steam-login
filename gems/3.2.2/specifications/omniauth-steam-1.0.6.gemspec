# -*- encoding: utf-8 -*-
# stub: omniauth-steam 1.0.6 ruby lib

Gem::Specification.new do |s|
  s.name = "omniauth-steam".freeze
  s.version = "1.0.6".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Rodrigo Navarro".freeze]
  s.date = "2018-07-30"
  s.email = ["rnavarro1@gmail.com".freeze]
  s.homepage = "https://github.com/reu/omniauth-steam".freeze
  s.rubygems_version = "3.5.6".freeze
  s.summary = "Steam strategy for OmniAuth".freeze

  s.installed_by_version = "3.5.6".freeze if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<omniauth-openid>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<multi_json>.freeze, [">= 0".freeze])
end
