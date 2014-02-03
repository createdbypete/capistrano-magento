# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = "capistrano-magento"
  gem.version       = "0.0.1"
  gem.authors       = ["Peter Rhoades"]
  gem.email         = ["createdbypete@gmail.com"]
  gem.description   = %q{Magento specific tasks for Capistrano}
  gem.summary       = %q{Magento specific tasks for Capistrano}
  gem.homepage      = "http://github.com/createdbypete/capistrano-magento"
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split($/)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "capistrano", "~> 3.1"
end
