# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruby_search_object/version'

Gem::Specification.new do |spec|
  spec.name          = "ruby_search_object"
  spec.version       = RubySearchObject::VERSION
  spec.authors       = ["Vijayanand Nandam"]
  spec.email         = ["vijayanand.nandam@gmail.com"]
  spec.description   = %q{A ruby service object pattern}
  spec.summary       = %q{Implements the ruby search service object pattern to encapsulate search functionality on records of an object}
  spec.homepage      = "http://cybrilla.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency 'rake', '~> 10.3', '>= 10.3.2'
end
