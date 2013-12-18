# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano/magento/version'

Gem::Specification.new do |spec|
  spec.name          = "capistrano-magento"
  spec.version       = Capistrano::Magento::VERSION
  spec.authors       = ["Peter Rhoades"]
  spec.email         = ["createdbypete@gmail.com"]
  spec.description   = %q{Magento specific tasks for Capistrano}
  spec.summary       = %q{Magento specific tasks for Capistrano}
  spec.homepage      = "http://github.com/createdbypete/capistrano-magento"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_dependency 'capistrano', '~> 3.0'
end
