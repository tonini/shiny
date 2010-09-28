module Shiny
  class HTML < Basic
    # the 17 w3c supported color names
    # http://www.w3.org/TR/CSS21/syndata.html#value-def-color
    FORMATS = {
      'black'        => "<span style='color: black;'>",
      'silver'       => "<span style='color: silver;'>",
      'gray'         => "<span style='color: gray;'>",
      'white'        => "<span style='color: white;'>",
      'maroon'       => "<span style='color: maroon;'>",
      'red'          => "<span style='color: red;'>",
      'purple'       => "<span style='color: purple;'>",
      'fuchsia'      => "<span style='color: fuchsia;'>",
      'green'        => "<span style='color: green;'>",
      'lime'         => "<span style='color: lime;'>",
      'olive'        => "<span style='color: olive;'>",
      'yellow'       => "<span style='color: yellow;'>",
      'navy'         => "<span style='color: navy;'>",
      'blue'         => "<span style='color: blue;'>",
      'teal'         => "<span style='color: teal;'>",
      'aqua'         => "<span style='color: aqua;'>",
      'orange'       => "<span style='color: orange;'>",
      'on_black'     => "<span style='background-color: black;'>",
      'on_silver'    => "<span style='background-color: silver;'>",
      'on_gray'      => "<span style='background-color: gray;'>",
      'on_white'     => "<span style='background-color: white;'>",
      'on_maroon'    => "<span style='background-color: maroon;'>",
      'on_red'       => "<span style='background-color: red;'>",
      'on_purple'    => "<span style='background-color: purple;'>",
      'on_fuchsia'   => "<span style='background-color: fuchsia;'>",
      'on_green'     => "<span style='background-color: green;'>",
      'on_lime'      => "<span style='background-color: lime;'>",
      'on_olive'     => "<span style='background-color: olive;'>",
      'on_yellow'    => "<span style='background-color: yellow;'>",
      'on_navy'      => "<span style='background-color: navy;'>",
      'on_blue'      => "<span style='background-color: blue;'>",
      'on_teal'      => "<span style='background-color: teal;'>",
      'on_aqua'      => "<span style='background-color: aqua;'>",
      'on_orange'    => "<span style='background-color: orange;'>",
      'bold'         => "<span style='font-weight: bold;'>",
      'underline'    => "<span style='text-decoration: underline;'>",
      'overline'     => "<span style='text-decoration: overline;'>",
      'line_through' => "<span style='text-decoration: line-through;'>",
      'blink'        => "<span style='text-decoration: blink;'>"
    }

    SPAN_BEGIN = "<span>"
    SPAN_END   = "</span>"

    # generate instance methods
    FORMATS.each do |name, value|
      class_eval <<-DEF
        def #{name}
          @string = "#{value}" + @string + "#{SPAN_END}"
          HTML.new(@string)
        end
      DEF
    end

    # remove all html format tags
    def blank
      @string.gsub(/(<span [^>]+>|<\/span>)/, '')
    end

  end
end
