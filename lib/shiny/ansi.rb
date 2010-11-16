module Shiny
  # The ansi class serve a great list of color and a few format
  # methods. To get an overview of all the generetad method, just look
  # at the CODES hash
  #
  # Some color examples:
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
  class ANSI < Basic

    # ansi escape sequences list
    CODES = {
      :black             =>   "\e[30m",
      :red               =>   "\e[31m",
      :green             =>   "\e[32m",
      :yellow            =>   "\e[33m",
      :blue              =>   "\e[34m",
      :magenta           =>   "\e[35m",
      :cyan              =>   "\e[36m",
      :white             =>   "\e[37m",
      :bright_black      =>   "\e[90m",
      :bright_red        =>   "\e[91m",
      :bright_green      =>   "\e[92m",
      :bright_yellow     =>   "\e[93m",
      :bright_blue       =>   "\e[94m",
      :bright_magenta    =>   "\e[95m",
      :bright_cyan       =>   "\e[96m",
      :bright_white      =>   "\e[97m",
      :on_black          =>   "\e[40m",
      :on_red            =>   "\e[41m",
      :on_green          =>   "\e[42m",
      :on_yellow         =>   "\e[43m",
      :on_blue           =>   "\e[44m",
      :on_magenta        =>   "\e[45m",
      :on_cyan           =>   "\e[46m",
      :on_white          =>   "\e[47m",
      :on_bright_black   =>  "\e[100m",
      :on_bright_red     =>  "\e[101m",
      :on_bright_green   =>  "\e[102m",
      :on_bright_yellow  =>  "\e[103m",
      :on_bright_blue    =>  "\e[104m",
      :on_bright_magenta =>  "\e[105m",
      :on_bright_cyan    =>  "\e[106m",
      :on_bright_white   =>  "\e[107m",
      :reset             =>    "\e[0m",
      :bold              =>    "\e[1m",
      :underline         =>    "\e[4m",
      :negative          =>    "\e[7m",
      :blink             =>    "\e[5m"
    }

    # list of available ansi colors
    COLORS  = ['black', 'red', 'green', 'yellow', 'blue', 'magenta', 'cyan', 'white']

    # list of available ansi effects
    EFFECTS = ['bold', 'underline', 'negative', 'blink']

    # Generate color instance methods
    # See CODES for a list of the created methods
    CODES.each do |code, value|
      next if code == :reset
      reset = CODES[:reset]
      class_eval <<-DEF
        def #{code.to_s}
          @string = "#{value}" + @string + "#{reset}"
          self
        end
      DEF
    end

    # Remove all ansi escape sequences from the string
    #
    # @return [String] from ansi escape sequences cleaned
    def blank
      @string.gsub(/\e\[[0-9]+m/,'')
    end
  end
end
