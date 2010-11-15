# -*- coding: utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Shiny do

  describe "#say" do
    it "should print string to the stdout stream" do
      $stdout.should_receive(:print).with("hey dude!\n")
      Shiny.say("hey dude!")
    end

    it "should print string without a linebreak" do
      $stdout.should_receive(:print).with("hey dude, no linebreak please")
      Shiny.say("hey dude, no linebreak please", :linebreak => false)
    end

    it "should print the string as error formated"do
      $stdout.should_receive(:print).with("\e[31mOh, there is an error!\e[0m\n")
      Shiny.say("Oh, there is an error!", :type => :error)
    end

    it "should print the string as success formated"do
      $stdout.should_receive(:print).with("\e[32mSuccessfully\e[0m\n")
      Shiny.say("Successfully", :type => :success)
    end
  end

  describe "#linebreak" do
    it "should print a linebreak" do
      $stdout.should_receive(:print).with("\n")
      Shiny.linebreak
    end

    it "should print 3 linebreaks" do
      $stdout.should_receive(:print).with("\n\n\n")
      Shiny.linebreak(3)
    end
  end

  describe "#wrap" do
    it "should print a wrapped string" do
      output =  "#####################\n"
      output += "# Hello I'm wrapped #\n"
      output += "#####################\n"

      $stdout.should_receive(:print).with(output)
      Shiny.wrap("Hello I'm wrapped")
    end

    it "should print a wrapped string with other wrap sign" do
      output =  "*********************\n"
      output += "* Hello I'm wrapped *\n"
      output += "*********************\n"

      $stdout.should_receive(:print).with(output)
      Shiny.wrap("Hello I'm wrapped", "*")
    end
  end

  describe "#log" do
    it "should log the message in a log file" do
      Shiny.log("please log me in!")
      File.exists?("logfile.log").should == true
      File.delete("logfile.log")
    end

    it "should log the message to the 'mylogfile.log' file" do
      Shiny.log("Arrrr, another filename", "mylogfile.log")
      File.exists?("mylogfile.log").should == true
      File.delete("mylogfile.log")
    end
  end
end

