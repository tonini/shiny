require 'shiny/ansi'
require 'shiny/helpers'

class Shiny

  extend Helpers

  # Shiny gives you some common ansi escape sequences, which
  # are available over a defined proxy method called 'shell', in
  # the core ruby String class.
  #
  # Some colors examples:
  #
  # puts "magenta".shell.magenta
  # puts "bold blue".shell.bold.blue
  # puts "yellow on cyan".shell.yellow.on_cyan
  # puts "bright blue on green".shell.bright_blue.on_green
  # puts "red on bright blue".shell.red.on_bright_blue
  #
  # Some other effect examples:
  #
  # puts "bold".shell.bold
  # puts "oh! i'm blinking".shell.blink
  # puts "nice and underlined".shell.underline
  # puts "other side, please".shell.negative
  def initialize(string)
    @string = string
  end

  ANSI::ESCAPE_SEQUENCES.each do |code, value|
    next if code == 'reset'
    reset = ANSI::ESCAPE_SEQUENCES['reset']
    class_eval <<-DEF
      def #{code}
        @string = "#{value}" + @string + "#{reset}"
        Shiny.new(@string)
      end
    DEF
  end

  def to_s
    @string
  end

  # remove all ansi escape sequences
  def blank
    @string.gsub(/\e\[[0-9]+m/,'')
  end

end

# instead to extend the ruby core string class with all the ansi
# escape methods, there is a proxy method called shell, to serve
# all the ansi escape functionality
class String
  def shell; Shiny.new(self); end
  alias ansi shell
end
