# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "mcutter/version"

Gem::Specification.new do |s|
  s.name        = "mcutter"
  s.version     = Mcutter::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Roman V. Babenko"]
  s.email       = ["romanvbabenko@gmail.com"]
  s.homepage    = "http://romanvbabenko.com"
  s.summary     = %q{Movie cutter}
  s.description = %q{Just Movie cutter}

  s.rubyforge_project = "mcutter"

  s.add_dependency "thor"

  s.add_development_dependency "bundler", ">= 1.0.0"
  s.add_development_dependency "rspec", "~> 2.5.0"
  s.add_development_dependency "fuubar"
  s.add_development_dependency "autotest"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
