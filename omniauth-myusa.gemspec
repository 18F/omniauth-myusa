# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-myusa/version'

Gem::Specification.new do |gem|
  gem.name          = "omniauth-myusa"
  gem.version       = Omniauth::Myusa::VERSION
  gem.authors       = ["Greg Gershman", "Christopher Papazian"]
  gem.email         = ["gregory.gershman@gsa.gov"]
  gem.description   = %q{OmniAuth strategy for MyUSA.}
  gem.summary       = %q{OmniAuth strategy for MyUSA.}
  gem.homepage      = "https://github.com/GSA-OCSIT/omniauth-myusa"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_dependency 'omniauth-oauth2', '~> 1.0'
end
