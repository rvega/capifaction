# -*- encoding: utf-8 -*-
require File.expand_path('../lib/capifaction/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Juan Hoyos"]
  gem.email         = ["juan.hoyosr@gmail.com"]
  gem.description   = %q{Some common Capistrano recipies for Webfaction}
  gem.summary       = %q{Webfaction Capistrano recipies}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "capifaction"
  gem.require_paths = ["lib"]
  gem.version       = Capifaction::VERSION

  gem.add_runtime_dependency "capistrano", ">=2.12.0"
end
