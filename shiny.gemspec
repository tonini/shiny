Gem::Specification.new do |s|
  s.name        = "shiny"
  s.version     = "0.3.1"
  s.author      = "Samuel Tonini"
  s.email       = "tonini.samuel@gmail.com"
  s.homepage    = "http://github.com/zastav/shiny"
  s.summary     = "Shiny ansi and html format methods."
  s.description = "Some common nice and shiny ansi escapse sequences and html format tags for the daily grind in the shell and browser."

  s.files        = Dir["{lib,spec}/**/*", "[A-Z]*"]
  s.require_path = "lib"

  s.add_development_dependency("rspec", ">= 2.0.0")

  s.rubyforge_project = s.name
  s.required_rubygems_version = ">= 1.3.4"
end
