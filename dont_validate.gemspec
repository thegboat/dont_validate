# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dont_validate/version'

Gem::Specification.new do |spec|
  spec.name          = "dont_validate"
  spec.version       = DontValidate::VERSION::STRING
  spec.authors       = ["Grady Griffin"]
  spec.email         = ["gradygriffin@gmail.com"]
  spec.description   = %q{Gem to remove previously set validations}
  spec.summary       = %q{Removes validations in a ActiveModel models when the changes to the original class or superclass are not feasible}
  spec.homepage      = "https://github.com/thegboat/dont_validate"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activemodel"  

  spec.add_development_dependency("rspec")
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
