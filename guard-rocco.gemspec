# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "guard-rocco"

Gem::Specification.new do |s|
  s.name        = "guard-rocco"
  s.version     = Guard::Rocco::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["John Bintz"]
  s.email       = ["john@coswellproductions.com"]
  s.homepage    = ""
  s.summary     = %q{Guard to generate Rocco documentation}
  s.description = %q{Guard to generate Rocco documentation}

  s.rubyforge_project = "guard-rocco"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'guard', '>= 0.4.0'
  s.add_dependency 'rocco'
  s.add_development_dependency 'rspec', '~> 2.6.0'
  s.add_development_dependency 'mocha'
end

