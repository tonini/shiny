module Shiny
  module Helpers

    def say(message, options={})
      options[:linebreak] = true unless options.has_key?(:linebreak)

      message = message.ansi.send(options[:color]) if options[:color]
      message = format(message, options[:type]) unless options[:color]
      message << "\n" if options[:linebreak]

      $stdout.print message
    end

    def log(message, filename="logfile.log")
      File.open(filename, "a+") do |f|
        f << "#{Time.now}: #{message}\n"
      end
    end

    def linebreak(amount=1)
      $stdout.print "\n" * amount
    end

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

