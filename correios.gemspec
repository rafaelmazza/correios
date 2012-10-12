# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'correios/version'

Gem::Specification.new do |gem|
  gem.name          = "correios"
  gem.version       = Correios::VERSION
  gem.authors       = ["Rafael Mazza"]
  gem.email         = ["rafael@cafeazul.com.br"]
  gem.description   = %q{Search for corresponding zipcode address using Correios web service}
  gem.summary       = gem.description
  gem.homepage      = "http://www.cafeazul.com.br"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  
  gem.add_dependency 'nokogiri', '~> 1.5'
  gem.add_dependency 'faraday', '~> 0.8'
  gem.add_development_dependency 'rspec', '~> 2.11'
  gem.add_development_dependency 'webmock', '~> 1.8'
end
