require "./spec_helper"

private class Foo
  var primitive = 1
  var primitive_with_type : Int32 = 1

  var literal = "a"
  var literal_with_type : String = "a"

  var new = Array(Int32).new
  var new_with_type : Array(Int32) = Array(Int32).new

  var chain_with_type : Array(String) = [1].map(&.to_s)

  var method_with_type : String = build_value

  var codes_with_type : Int32 = (a = [1]; a << 2; a.sum)
  
  var question? = true
  var question_with_type? : Bool = true
  
  var bang! = true
  var bang_with_type! : Bool = true

  private def build_value
    "value"
  end
end

describe "var" do
  foo = Foo.new

  it "primitive" do
    foo.primitive.should eq(1)
  end

  it "primitive with type" do
    foo.primitive_with_type.should eq(1)
  end

  it "literal" do
    foo.literal.should eq("a")
  end

  it "literal with type" do
    foo.literal_with_type.should eq("a")
  end

  it "new" do
    foo.new.should eq([] of String)
  end

  it "new with type" do
    foo.new_with_type.should eq([] of Int32)
  end

  it "chain_with_type" do
    foo.chain_with_type.should eq(["1"])
  end

  it "codes_with_type" do
    foo.codes_with_type.should eq(3)
  end

  it "method with type" do
    foo.method_with_type.should eq("value")
  end

  it "can update value" do
    foo.primitive = 2
    foo.primitive.should eq(2)
  end

  it "question" do
    foo.question?.should eq(true)
  end

  it "question_with_type" do
    foo.question_with_type?.should eq(true)
  end

  it "bang" do
    foo.bang!.should eq(true)
  end

  it "bang_with_type" do
    foo.bang_with_type!.should eq(true)
  end
end
