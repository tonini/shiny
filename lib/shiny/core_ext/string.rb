require 'shiny/basic'
require 'shiny/ansi'
require 'shiny/html'

# instead to extend the ruby core string class with all the ansi
# escape methods, there is a proxy method called shell, to serve
# all the ansi escape functionality
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
