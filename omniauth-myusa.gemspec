# -*- encoding: utf-8 -*-
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-myusa/version'

Gem::Specification.new do |gem|
  gem.name = "omniauth-myusa"
  gem.version = Omniauth::Myusa::VERSION
  gem.authors = ["Greg Gershman", "Christopher Papazian"]
  gem.email = ["gregory.gershman@gsa.gov"]
  gem.description = %q{OmniAuth strategy for MyUSA.}
  gem.summary = %q{OmniAuth strategy for MyUSA.}
  gem.homepage = "https://github.com/18F/omniauth-myusa"

  gem.files = `git ls-files`.split($/)
  gem.executables = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "omniauth", "~> 1.0"
  # oauth2 gem locked hard at pre-1.4.0 because 1.4.0 breaks.
  # See comments on https://github.com/intridea/omniauth-oauth2/commit/26152673224aca5c3e918bcc83075dbb0659717f
  gem.add_dependency "omniauth-oauth2", "1.3.1"
end
