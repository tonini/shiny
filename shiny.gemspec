# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'shiny/version'

Gem::Specification.new do |s|
  s.name          = "shiny"
  s.version       = Shiny::VERSION
  s.author        = "Samuel Tonini"
  s.email         = "tonini.samuel@gmail.com"
  s.homepage      = "http://github.com/tonini/shiny"
  s.summary       = "Shiny ansi and html format methods."
  s.description   = "Some common nice and shiny ansi escapse sequences and html format tags for the daily grind in the shell and browser."
  s.license       = "MIT"

  s.files         = `git ls-files`.split($/)
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.add_development_dependency "bundler", "~> 1.3"
  s.add_development_dependency "rake"
  s.add_development_dependency("rspec", ">= 2.0.0")
end
