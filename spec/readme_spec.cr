require "./spec_helper"

private class Foo
  val x = 1
  var y = "123"

  val z : Int32 = (a = [1]; a << 2; a.sum)
end

describe "README.md" do
  it "works" do
    foo = Foo.new
    foo.x          .should eq(1)
    (foo.y = "xxx").should eq("xxx")
    foo.z          .should eq(3)
  end
end
