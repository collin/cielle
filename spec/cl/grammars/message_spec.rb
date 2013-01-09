require 'spec_helper'

describe CL::MessageParser do
  def parse(text)
    CL::MessageParser.new.parse(text)
  end

  it "should parse a message" do
    parse("message").text_value.should == "message"
  end

  it "should parse a message with an argument" do
    message = parse("message argument")
    message.name.should == "message"
    message.argument_values.should == ["argument"]

    parse("hello-world whats up").name.should == "hello-world"
  end

  it "should parse a message with arguments" do
    message = parse("message with some arguments")
    message.argument_values.should == %w(with some arguments)
  end

  it "should parse a quoted argument" do
    message = parse("message with *quoted argument")
    message.argument_values.should == %w(with *quoted argument)
  end

  it "should parse a splatted argument" do
    message = parse("message with splat... argument")
    message.argument_values.should == %w(with splat... argument)
  end

  it "should parse a default argument value" do
    message = parse("message with a default value=whatup boys")
    message.argument_values.should == %w(with a default value=whatup boys)
  end
end