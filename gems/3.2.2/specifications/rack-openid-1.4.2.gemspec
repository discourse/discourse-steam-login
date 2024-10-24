# -*- encoding: utf-8 -*-
# stub: rack-openid 1.4.2 ruby lib

Gem::Specification.new do |s|
  s.name = "rack-openid".freeze
  s.version = "1.4.2".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Michael Grosser".freeze, "Joshua Peek".freeze]
  s.cert_chain = ["-----BEGIN CERTIFICATE-----\nMIIDMjCCAhqgAwIBAgIBADANBgkqhkiG9w0BAQUFADA/MRAwDgYDVQQDDAdtaWNo\nYWVsMRcwFQYKCZImiZPyLGQBGRYHZ3Jvc3NlcjESMBAGCgmSJomT8ixkARkWAml0\nMB4XDTEzMDIwMzE4MTMxMVoXDTE0MDIwMzE4MTMxMVowPzEQMA4GA1UEAwwHbWlj\naGFlbDEXMBUGCgmSJomT8ixkARkWB2dyb3NzZXIxEjAQBgoJkiaJk/IsZAEZFgJp\ndDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMorXo/hgbUq97+kII9H\nMsQcLdC/7wQ1ZP2OshVHPkeP0qH8MBHGg6eYisOX2ubNagF9YTCZWnhrdKrwpLOO\ncPLaZbjUjljJ3cQR3B8Yn1veV5IhG86QseTBjymzJWsLpqJ1UZGpfB9tXcsFtuxO\n6vHvcIHdzvc/OUkICttLbH+1qb6rsHUceqh+JrH4GrsJ5H4hAfIdyS2XMK7YRKbh\nh+IBu6dFWJJByzFsYmV1PDXln3UBmgAt65cmCu4qPfThioCGDzbSJrGDGLmw/pFX\nFPpVCm1zgYSb1v6Qnf3cgXa2f2wYGm17+zAVyIDpwryFru9yF/jJxE38z/DRsd9R\n/88CAwEAAaM5MDcwCQYDVR0TBAIwADAdBgNVHQ4EFgQUsiNnXHtKeMYYcr4yJVmQ\nWONL+IwwCwYDVR0PBAQDAgSwMA0GCSqGSIb3DQEBBQUAA4IBAQAlyN7kKo/NQCQ0\nAOzZLZ3WAePvStkCFIJ53tsv5Kyo4pMAllv+BgPzzBt7qi605mFSL6zBd9uLou+W\nCo3s48p1dy7CjjAfVQdmVNHF3MwXtfC2OEyvSQPi4xKR8iba8wa3xp9LVo1PuLpw\n/6DsrChWw74HfsJN6qJOK684hJeT8lBYAUfiC3wD0owoPSg+XtyAAddisR+KV5Y1\nNmVHuLtQcNTZy+gRht3ahJRMuC6QyLmkTsf+6MaenwAMkAgHdswGsJztOnNnBa3F\ny0kCSWmK6D+x/SbfS6r7Ke07MRqziJdB9GuE1+0cIRuFh8EQ+LN6HXCKM5pon/GU\nycwMXfl0\n-----END CERTIFICATE-----\n".freeze]
  s.date = "2014-01-20"
  s.email = "michael@grosser.it".freeze
  s.homepage = "https://github.com/grosser/rack-openid".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.5.6".freeze
  s.summary = "Provides a more HTTPish API around the ruby-openid library".freeze

  s.installed_by_version = "3.5.6".freeze if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<rack>.freeze, [">= 1.1.0".freeze])
  s.add_runtime_dependency(%q<ruby-openid>.freeze, [">= 2.1.8".freeze])
end
