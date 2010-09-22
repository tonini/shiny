require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Shiny do

  # overwrite for testing
  class Shiny
    def ==(string)
      to_s == string
    end
  end

  it 'should return a green string' do
    "green".shell.green.should == "\e[32mgreen\e[0m"
  end

  it 'should return an on yellow string' do
    "on yellow".shell.on_yellow.should == "\e[43mon yellow\e[0m"
  end

  it 'should return an on bright magenta string' do
    "on bright magenta".shell.on_bright_magenta == "\e[105mon bright magenta\e[0m"
  end

  it 'should return a red on white string' do
    "red on white".shell.red.on_white == "\e[47m\e[31mred on white\e[0m\e[0m"
  end

  it 'should return a bright blue string' do
    "bright blue".shell.bright_blue.should == "\e[94mbright blue\e[0m"
  end

  it 'should return a black on bright green string' do
    "black on bright green".shell.black.on_bright_green.should == "\e[102m\e[30mblack on bright green\e[0m\e[0m"
  end

  it 'should return an underlined string' do
    "underline".shell.underline == "\e[4munderline\e[0m"
  end

  it 'should return a bold string' do
    "bold".shell.bold == "\e[1mbold\e[0m"
  end

  it 'should return a negative string' do
    "negative".shell.negative == "\e[7mnegative\e[0m"
  end

  it 'should return a blinking string' do
    "blinking".shell.blink == "\e[5mblinking\e[0m"
  end

  it 'should clear all ansi escape sequences from string' do
    "\e[47m\e[31mred on white\e[0m\e[0m".shell.blank == "red on white"
  end

  it 'should run also with the alias method' do
    "try the alias method".shell.red.should == "\e[31mtry the alias method\e[0m"
  end

end
