#the gemspec file
Gem::Specification.new do |s|
  s.add_dependency 'omniauth', '~> 1.0'
  s.add_dependency 'omniauth-oauth2', '~> 1.0'
  s.add_dependency 'oauth2', '~> 0.8.1'
  s.name        = 'omniauth-yelp'
  s.version     = '1.0.0'
  s.add_development_dependency 'rspec', '~> 2.7'
  s.add_development_dependency 'rack-test'
  s.add_development_dependency 'webmock'
  s.add_development_dependency 'simplecov'
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.homepage   = 'https://github.com/dhaneshnm/omniauth-yelp'
  s.require_paths = ["lib"]
  s.license       = "MIT"
  s.date        = '2014-04-12'
  s.summary     = "omniauth-yelp!"
  s.description = "A simple  omniauth gem for Yelp! API"
  s.authors     = ["Dhanesh Neela Mana"]
  s.email       = 'dhanesh.n.m19@gmail.com'
  s.files       = ["lib/omniauth-yelp.rb","lib/omniauth/yelp.rb","lib/omniauth/strategies/yelp.rb","lib/omniauth/yelp/version.rb"]#git ls-files`.split("\n")
end

