module Shiny
  class Basic
    # Object initializer
    #
    # @param [String] To assign to @string
    def initialize(string)
      @string = string
    end

    # Object printer
    #
    # @return [String]
    def to_s
      @string
    end
  end
end
