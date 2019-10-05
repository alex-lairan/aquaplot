require "../../../src/aquaplot/core/common/options"
require "../../../src/aquaplot/core/common/exceptions"

include OptionsModule

describe "Options" do
  it "Ensure offsets set_key mutates option" do
    key = "offsets"
    offset = Offset.new 0, 0, 0, 1
    offset.set_key(key)
    offset.key.should eq(key)
  end

  it "Ensure offsets raises KeyError without key" do
    offset = Offset.new 1, 1, 1, 1
    expect_raises(KeyError) do
      offset.to_s
    end
  end

  it "Ensure offsets proper output" do
    offset = Offset.new 1, 1, 1, 1, "foo"
    offset.to_s.should eq("set foo 1, 1, 1, 1")
  end

  it "Ensure offsets empty output with empty offset" do
    offset = Offset.new 0, 0, 0, 0, "foo"
    offset.to_s.should be_nil
  end

  it "Ensure XY set_key mutates option" do
    key = "foobar"
    xy = XY.new 5, 5
    xy.set_key(key)
    xy.key.should eq(key)
  end

  it "Ensure XY raises KeyError without key" do
    xy = XY.new 1, 1
    expect_raises(KeyError) do
      xy.to_s
    end
  end

  it "Ensure XY empty output with empty option" do
    xy = XY.new 0, 0, "foo"
    xy.to_s.should be_nil
  end

  it "Ensure XY proper string output" do
    xy = XY.new 5, 5, "foo"
    xy.to_s.should eq("set foo 5, 5")
  end

  it "Ensure XY raises KeyError without key in range output" do
    xy = XY.new 5, 5
    expect_raises(KeyError) do
      xy.to_s
    end
  end

  it "Ensure XY empty range output with empty range option" do
    xy = XY.new 0, 0, "foo"
    xy.to_range.should be_nil
  end

  it "Ensure XY proper range output" do
    xy = XY.new 5, 5, "foo"
    xy.to_range.should eq("set foo [5:5]")
  end
end
