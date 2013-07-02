# Shiny

Shiny extends the ruby core string class with two methods, ansi and html. These two are proxy methods to provide a bunch of color and text formating methods.
Over ansi there are the commen known ansi escape sequences available, bold, blink, underline and the whole colorful format things. The method html serves the same but in the html way, it makes the
standart w3c color names available and also a few other formats like overline, underline, blink etc.

## Installation

```shell
$ gem install shiny
```

## Usage

First require it:

```ruby
require 'shiny'
```

Some ansi color examples:

```ruby
puts "magenta".ansi.magenta
puts "bold blue".ansi.bold.blue
puts "yellow on cyan".ansi.yellow.on_cyan
puts "bright blue on green".ansi.bright_blue.on_green
puts "red on bright blue".ansi.red.on_bright_blue
```

Some other ansi effect examples:

```ruby
puts "bold".ansi.bold
puts "oh! i'm blinking".ansi.blink
puts "nice and underlined".ansi.underline
puts "other side, please".ansi.negative
```

Some html color examples: (the html formats should be used in the browser ;)

```ruby
"orange".html.orange
"bold red".html.bold.red
"yellow on olive".html.yellow.on_olive
"blue on teal".html.blue.on_teal
"fuchsia".html.fuchsia
```

Some other html effect examples:

```ruby
"bold".html.bold
"oh! i'm blinking".html.blink
"nice and underlined".html.underline
"overline".html.overline
"line-through".html.line_through
```

Some terminal helper examples:

```ruby
include Shiny::Helpers

say("green day?", :color => :green)
say("fail!", :type => :error)

log("for later") # default: logfile.log
log("there please", "myfile.log")

wrap("I'm not alone") # surrounded with the default: # char
wrap("Oh...", "*") # surrounded with the * char
```

## Contributions are very welcome!

1. Fork shiny
2. Create a topic branch - `git checkout -b my_branch`
4. Push to your branch - `git push origin my_branch`
5. Send me a pull-request for your topic branch
6. That's it!

## License

See [LICENSE](LICENSE) for details.
