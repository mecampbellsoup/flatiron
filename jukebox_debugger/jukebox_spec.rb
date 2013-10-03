# run this file at the command line: rspec jukebox_spec.rb

# remember that tests can be your to-do list, and that you should get one
# test to pass at a time, doing the simplest thing you can for each one.

# read your rspec output carefully to find what you need to fix. the errors
# will guide you!

require_relative './spec_helper.rb'
require_relative './runner.rb'
require 'pry'

describe "Awesome Jukebox" do

  describe "#run" do
    it "should print a greeting to the user as the first thing" do
      run.should eq(nil)
    end
  end

  describe "it should give a command prompt when it starts containing 'list', 'play', 'exit', 'help'" do
  end
end