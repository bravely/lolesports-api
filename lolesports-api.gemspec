# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lolesports/api/version'

Gem::Specification.new do |spec|
  spec.name          = 'lolesports-api'
  spec.version       = Lolesports::Api::VERSION
  spec.authors       = ['Jake Mays']
  spec.email         = ['quaunaut@gmail.com']
  spec.summary       = 'Wraps the lolesports API.'
  spec.description   = 'Wraps the lolesports API.'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split('\x0')
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.3'
  spec.add_development_dependency 'guard-rspec', '~> 4.6'
  spec.add_development_dependency 'guard-rubocop', '~> 1.2'
  spec.add_development_dependency 'vcr', '~> 2.9'
  spec.add_development_dependency 'webmock', '~> 1.21'

  spec.add_dependency 'json', '~> 1.8'
  spec.add_dependency 'faraday', '~> 0.9'
end
