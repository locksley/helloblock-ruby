# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'helloblock/ruby/version'

Gem::Specification.new do |spec|
  spec.name          = "helloblock-ruby"
  spec.version       = Helloblock::Ruby::VERSION
  spec.authors       = ["Nathaniel Wroblewski"]
  spec.email         = ["nathanielwroblewski@gmail.com"]
  spec.description   = %q{Ruby wrapper for the HelloBlock.io API}
  spec.summary       = %q{Ruby wrapper for the HelloBlock.io API}
  spec.homepage      = "http://www.github.com/nathanielwroblewski/helloblock-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
