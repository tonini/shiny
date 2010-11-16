require 'shiny/basic'
require 'shiny/ansi'
require 'shiny/html'

# Extend the ruby core string class with ansi escape
# sequences and html methods through two proxy methods
class String

  # Serves ansi escape sequence method through a new ansi object
  #
  # @return [Shiny::ANSI] a new object
  def ansi
    Shiny::ANSI.new(self)
  end

  alias shell ansi

  # Serves ansi escape sequence method through a new html object
  #
  # @return [Shiny::HTML] a new object
  def html
    Shiny::HTML.new(self)
  end

  alias browser html
end
