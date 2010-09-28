require 'shiny/ansi'

module Shiny
  module Helpers
    def colors
      ANSI::COLORS
    end

    def effects
      ANSI::EFFECTS
    end

    def show_colors
      ANSI::COLORS.each do |color|
        [color, "bright_#{color}", "on_#{color}", "on_bright_#{color}"].each do |code|
          $stdout.puts ANSI::CODES[code] + code + ANSI::CODES['reset']
        end
      end
      $stdout.flush
    end

    def show_effects
      ANSI::EFFECTS.each do |code|
        $stdout.puts ANSI::CODES[code] + code + ANSI::CODES['reset']
      end
      $stdout.flush
    end
  end
end
