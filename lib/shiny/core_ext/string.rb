require 'shiny/basic'
require 'shiny/ansi'
require 'shiny/html'

# instead to extend the ruby core string class with all the ansi
# escape and html methods, there are two proxy methods called ansi and
# html, to serve all the functionality.
class String
  def ansi
    Shiny::ANSI.new(self)
  end

  alias shell ansi

  def html
    Shiny::HTML.new(self)
  end

  alias browser html
end
