# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-kona/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-kona"
  spec.version       = Omniauth::Kona::VERSION
  spec.authors       = ["Ronald Salas"]
  spec.email         = ["ronaldsalas@deltek.com"]

  spec.summary       = 'Kona OAuth2 strategy for Omniauth'
  spec.homepage      = 'https://github.com/ronaldsalas/omniauth-kona'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'omniauth-oauth2', '~> 1.4'

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
