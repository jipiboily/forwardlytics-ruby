# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'forwardlytics/version'

Gem::Specification.new do |spec|
  spec.name          = "forwardlytics"
  spec.version       = Forwardlytics::VERSION
  spec.authors       = ["Jean-Philippe Boily"]
  spec.email         = ["j@jipi.ca"]

  spec.summary       = %q{This is a client for Forwardlytics.}
  spec.description   = %q{This is a client for Forwardlytics (https://github.com/jipiboily/forwardlytics). Takes event in and forwards them to various providers, mostly analytics providers.}
  spec.homepage      = "https://github.com/jipiboily/forwardlytics"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", ">= 3.4.0"
  spec.add_development_dependency "guard-rspec", ">= 4.6.5"
  spec.add_development_dependency "webmock", ">= 2.0.0"
  spec.add_development_dependency "timecop", ">= 0.8.0"
end
