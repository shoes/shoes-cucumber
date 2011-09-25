# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "shoes/cucumber/version"

Gem::Specification.new do |s|
  s.name        = "shoes-cucumber"
  s.version     = Shoes::Cucumber::VERSION
  s.authors     = ["Steve Klabnik", "Tobias Pfeiffer"]
  s.email       = ["steve@steveklabnik.com", "tobias.pfeiffer@student.hpi.uni-potsdam"]
  s.homepage    = "http://github.com/shoes/shoes-cucumber"
  s.summary     = %q{Use Cukes to test your Shoes!}
  s.description = %q{Use Cukes to test your Shoes! Mostly mocking at this point, but eventually will let you test all aspects of Shoes apps.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "cucumber"
  s.add_runtime_dependency "rspec"
  s.add_runtime_dependency "shoes-mocks"
end

