module Shiny
  module Helpers
    # Send a message to the $stdout stream
    #
    # @example Print a message
    #   "Shiny.message('What is that?')" #=> "What is that?\n"
    #
    # @example Print message whitout linebreak
    #   "Shiny.message('What is that?', :linebreak => false)" #=> "What is that?"
    #
    # @example Print message in red
    #   "Shiny.message('red!', :color => :red)" #=> "\e[31mred!\e[0m\n"
    #
    # @example Print a success message
    #   "Shiny.message('success', :type => :success)" #=> "\e[32msuccess\e[0m\n"
    #
    # @param [String] the message which should send to $stdout
    # @option options [Boolean] :linebreak ('true')
    # @option options [Symbol] :color ('white') The message color
    # @option options [Symbol] :type The message type ':error' or ':success'
    def say(message, options={})
      options[:linebreak] = true unless options.has_key?(:linebreak)

      message = message.ansi.send(options[:color]) if options[:color]
      message = format(message, options[:type]) unless options[:color]
      message = message.to_s + "\n" if options[:linebreak]

      $stdout.print message
    end

    # Log a message in to a logfile
    #
    # @param [String] the message which should be logged into file
    # @param [String] filename ('logfile.log') the name of the logile
    def log(message, filename="logfile.log")
      File.open(filename, "a+") do |f|
        f << "#{Time.now}: #{message}\n"
      end
    end

    # Send a linebreak to the $stdout stream
    #
    # @param [Integer] amount ('1') Amount of linebreaks
    def linebreak(amount=1)
      $stdout.print "\n" * amount
    end

    # Wrap a message with a special sign and send it to the $stdout stream
    #
    # @param [String] the message which should be wrapped
    # @param [String] sign ('#') The character around the message
    def wrap(message, sign="#")
      sign = sign[0] if  sign.length > 1
      around = sign * (message.length + 4) + "\n"

      output = ""
      output << around
      output << "#{sign} #{message} #{sign}\n"
      output << around

      $stdout.print output
    end

  private

    def format(message, type)
      message = case type
                when :error    ; message.ansi.send(:red)
                when :success  ; message.ansi.send(:green)
                else
                  message
                end
      message.to_s
    end
  end
end

