#the gemspec file
Gem::Specification.new do |s|
  s.add_dependency 'omniauth', '~> 1.0'
  s.add_dependency 'omniauth-oauth2', '~> 1.0'
  s.add_dependency 'oauth2', '~> 0.8.1'
  s.name        = 'omniauth-yelp'
  s.version     = '0.0.0'
  s.add_development_dependency 'rspec', '~> 2.7'
  s.add_development_dependency 'rack-test'
  s.add_development_dependency 'webmock'
  s.add_development_dependency 'simplecov'
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]
  s.files         = `git ls-files`.split("\n")
  s.license       = "MIT"
  s.date        = '2014-10-23'
  s.summary     = "omniauth-yelp!"
  s.description = "A simple  omniauth gem"
  s.authors     = ["Dhanesh Neela Mana"]
  s.email       = 'dhanesh.n.m19@gmail.com'
  s.files       = ["lib/omniauth-yelp.rb","lib/omniauth-yelp/translator.rb"]
  s.homepage    = 'https://github.com/intridea/omniauth'
  s.license       = 'https://github.com/intridea/omniauth/blob/master/LICENSE.md'
end
#-*- encoding: utf-8 -*-
#require File.expand_path('../lib/omniauth-oauth2/version', __FILE__)

# Gem::Specification.new do |gem|
#   gem.add_dependency 'omniauth', '~> 1.0'
#   gem.add_dependency 'omniauth-oauth2', '~> 1.0'
#   gem.add_dependency 'oauth2', '~> 0.9.0'

#   gem.add_development_dependency 'rspec', '~> 2.7'
#   gem.add_development_dependency 'rack-test'
#   gem.add_development_dependency 'webmock'
#   gem.add_development_dependency 'simplecov'

#   gem.authors       = ["Dhanesh Neela Mana"]
#   gem.email         = ["dhanesh.n.m19@gmail.com"]
#   gem.description   = "omniauth-yelp!" #%q{An abstract OAuth2 strategy for OmniAuth.}
#   gem.summary       = "omniauth-yelp!" #%q{An abstract OAuth2 strategy for OmniAuth.}
#   #gem.homepage      = "https://github.com/intridea/omniauth-oauth2"
#   gem.license       = "MIT"

#   #gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
#   #gem.files         = `git ls-files`.split("\n")
#   #gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
#   gem.name          = "omniauth-yelp"
#   gem.require_paths = ["lib"]
#   gem.version       = "0.0.0"
# end
