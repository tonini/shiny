Gem::Specification.new do |s|
  s.name        = "shiny"
  s.version     = "0.1.0"
  s.author      = "Samuel Tonini"
  s.email       = "tonini.samuel@gmail.com"
  s.homepage    = "http://github.com/zastav/shiny"
  s.summary     = "some common nice and shiny ansi escapse sequences for the daily grind in the shell"
  s.description = <<-DESC
  Shiny gives you some common ansi escape sequences, which
  are available over a defined proxy method called 'shell', in
  the core ruby String class.

  Some colors examples:

  puts "magenta".shell.magenta
  puts "bold blue".shell.bold.blue
  puts "yellow on cyan".shell.yellow.on_cyan
  puts "bright blue on green".shell.bright_blue.on_green
  puts "red on bright blue".shell.red.on_bright_blue

  Some other effect examples:

  puts "bold".shell.bold
  puts "oh! i'm blinking".shell.blink
  puts "nice and underlined".shell.underline
  puts "other side, please".shell.negative
  DESC

  s.files        = Dir["{lib,spec}/**/*", "[A-Z]*"]
  s.require_path = "lib"

  s.rubyforge_project = s.name
  s.required_rubygems_version = ">= 1.3.4"
end
