# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-mygov/version'

Gem::Specification.new do |gem|
  gem.name          = "omniauth-mygov"
  gem.version       = Omniauth::Mygov::VERSION
  gem.authors       = ["Greg Gershman"]
  gem.email         = ["gregory.gershman@gsa.gov"]
  gem.description   = %q{OmniAuth strategy for MyGov.}
  gem.summary       = %q{OmniAuth strategy for MyGov.}
  gem.homepage      = "https://github.com/GSA-OCSIT/omniauth-mygov"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  
  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_dependency 'omniauth-oauth2', '~> 1.0'
end
