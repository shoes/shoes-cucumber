# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "shoes/cucumber/version"

Gem::Specification.new do |s|
  s.name        = "shoes-cucumber"
  s.version     = Shoes::Cucumber::VERSION
  s.authors     = ["Steve Klabnik"]
  s.email       = ["steve@steveklabnik.com"]
  s.homepage    = "http://github.com/shoes/shoes-cucumber"
  s.summary     = %q{This project lets you test Shoes apps with Cucumber.}
  s.description = %q{This project lets you test Shoes apps with Cucumber. It's mostly mocking stuff, see Shoes' tests for examples.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "cucumber"
  s.add_runtime_dependency "rspec"
end
