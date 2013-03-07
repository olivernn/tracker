# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tracker/version'

Gem::Specification.new do |gem|
  gem.name          = "tracker"
  gem.version       = Tracker::VERSION
  gem.authors       = ["Oliver Nightingale"]
  gem.email         = ["oliver.nightingale1@gmail.com"]
  gem.description   = %q{Simple time tracking tool for Batman}
  gem.summary       = %q{Simple time tracking tool for Batman}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_development_dependency('rspec')
  gem.add_development_dependency('rake')
end
