require "./spec_helper"

private class Foo
  val primitive = 1
  val primitive_with_type : Int32 = 1

  val literal = "a"
  val literal_with_type : String = "a"

  val new = Array(Int32).new
  val new_with_type : Array(Int32) = Array(Int32).new

  val chain_with_type : Array(String) = [1].map(&.to_s)

  val method_with_type : String = build_value

  val codes_with_type : Int32 = (a = [1]; a << 2; a.sum)
  
  private def build_value
    "value"
  end
end

describe "val" do
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
end
