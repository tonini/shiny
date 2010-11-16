module Shiny
  class HTML < Basic
    # List of the 17 w3c supported color names
    # @see http://www.w3.org/TR/CSS21/syndata.html#value-def-color
    STYLES = {
      :black        => 'color: black',
      :silver       => 'color: silver',
      :gray         => 'color: gray',
      :white        => 'color: white',
      :maroon       => 'color: maroon',
      :red          => 'color: red',
      :purple       => 'color: purple',
      :fuchsia      => 'color: fuchsia',
      :green        => 'color: green',
      :lime         => 'color: lime',
      :olive        => 'color: olive',
      :yellow       => 'color: yellow',
      :navy         => 'color: navy',
      :blue         => 'color: blue',
      :teal         => 'color: teal',
      :aqua         => 'color: aqua',
      :orange       => 'color: orange',
      :on_black     => 'background-color: black',
      :on_silver    => 'background-color: silver',
      :on_gray      => 'background-color: gray',
      :on_white     => 'background-color: white',
      :on_maroon    => 'background-color: maroon',
      :on_red       => 'background-color: red',
      :on_purple    => 'background-color: purple',
      :on_fuchsia   => 'background-color: fuchsia',
      :on_green     => 'background-color: green',
      :on_lime      => 'background-color: lime',
      :on_olive     => 'background-color: olive',
      :on_yellow    => 'background-color: yellow',
      :on_navy      => 'background-color: navy',
      :on_blue      => 'background-color: blue',
      :on_teal      => 'background-color: teal',
      :on_aqua      => 'background-color: aqua',
      :on_orange    => 'background-color: orange',
      :bold         => 'font-weight: bold',
      :underline    => 'text-decoration: underline',
      :overline     => 'text-decoration: overline',
      :line_through => 'text-decoration: line-through',
      :blink        => 'text-decoration: blink'
    }

    # HTML span begin tag
    SPAN_BEGIN = "<span>"

    # HTML span end tag
    SPAN_END   = "</span>"

    # Generate html format instance methods
    # See STYLES for a list of created methods
    STYLES.each do |name, value|
      define_method name do
        @string = "<span style=\"#{value};\">#{@string}</span>"
        self
      end
    end

    # Remove all html span format tags
    #
    # @return [String] from span tags cleaned
    def blank
      @string.gsub(/(<span [^>]+>|<\/span>)/, '')
    end
  end
end
