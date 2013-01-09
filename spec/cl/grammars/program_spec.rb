require 'spec_helper'

describe CL::ProgramParser do
  def parse(text)
    CL.parse(text)
  end

  it "should parse a blank program" do
    parse("").text_value.should == ""
  end

  it "should parse a single line" do
    parse("
message
").text_value.should == "message"
  end

  it "should parse multiple messages" do
    parse("
message one
message two
").text_value.should == "message one\nmessage two"
  end


  it "should parse a block" do
    parse("
message
  with block
    nested block
    more nested block
      deeper nested block
  more block
    even more nested block
").text_value.should == "message {
  with block {
    nested block
    more nested block {
      deeper nested block
    }
  }
  more block {
    even more nested block
  }
}"
  end
end