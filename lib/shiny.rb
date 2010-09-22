require 'shiny/ansi'

class Shiny

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

  def blank
    @string.gsub(/\e\[[0-9]+m/,'')
  end

  # some helpers to see how shiny the ansi sequences are
  class << self
    def colors
      ANSI::COLORS
    end

    def effects
      ANSI::EFFECTS
    end

    def show_colors
      ANSI::COLORS.each do |color|
        [color, "bright_#{color}", "on_#{color}", "on_bright_#{color}"].each do |code|
          $stdout.puts ANSI::ESCAPE_SEQUENCES[code] + code + ANSI::ESCAPE_SEQUENCES['reset']
        end
      end
      $stdout.flush
    end

    def show_effects
      ANSI::EFFECTS.each do |code|
        $stdout.puts ANSI::ESCAPE_SEQUENCES[code] + code + ANSI::ESCAPE_SEQUENCES['reset']
      end
      $stdout.flush
    end
  end
end

class String
  def shell; Shiny.new(self); end
  alias ansi shell
end
