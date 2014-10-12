# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
require "#{lib}/prawn/component/version"

Gem::Specification.new do |spec|
  spec.name          = "prawn-component"
  spec.version       = Prawn::Component::VERSION
  spec.authors       = ["Gregory Brown"]
  spec.email         = ["gregory.t.brown@gmail.com"]
  spec.summary       = "Prawn::Component"
  spec.description   = "A system for building reusable chunks of Prawn code"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "prawn", "~> 1.3.0"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", ">= 0.0"
end
