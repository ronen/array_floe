require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "ArrayFloe" do

  let (:enumerator) { defined?(Enumerator) ? Enumerator : Enumerable::Enumerator } # ruby 1.9 vs. 1.8

  let (:a1) { [:a] }
  let (:a5) { [:a, :b, :c, :d, :e] }

  context "each_with_floe" do

    it "correctly reports first" do
      a5.each_with_floe do |item, floe|
        floe.first?.should == (item == :a)
      end
    end

    it "correctly reports last" do
      a5.each_with_floe do |item, floe|
        floe.last?.should == (item == :e)
      end
    end

    it "correctly reports odd" do
      a5.each_with_floe do |item, floe|
        floe.odd?.should == [:b, :d].include?(item)
      end
    end

    it "correctly reports even" do
      a5.each_with_floe do |item, floe|
        floe.even?.should == [:a, :c, :e].include?(item)
      end
    end

    it "returns an enumerator" do
      a5.each_with_floe.should be_an_instance_of enumerator
    end

    it "iterates on the array entries" do
      a5.each_with_floe.collect{|item, floe| item}.should == a5
    end

    it "constructs floe strings" do
      a5.each_with_floe.collect{ |item, floe| floe.to_s }.should == [
        "first even",
        "odd",
        "even",
        "odd",
        "last even"
      ]
    end

    it "constructs floe string with first last and even when size == 1" do
      a1.each_with_floe.collect{|item, floe| floe.to_s}.should == [ "first last even" ]
    end
  end

  context "each_with_index_floe" do

    it "passes the index" do
      a5.each_with_index_floe do |item, i, floe|
        a5[i].should == item
      end
    end

    it "correctly reports first" do
      a5.each_with_index_floe do |item, i, floe|
        floe.first?.should == (item == :a)
      end
    end

    it "correctly reports last" do
      a5.each_with_index_floe do |item, i, floe|
        floe.last?.should == (item == :e)
      end
    end

    it "correctly reports odd" do
      a5.each_with_index_floe do |item, i, floe|
        floe.odd?.should == [:b, :d].include?(item)
      end
    end

    it "correctly reports even" do
      a5.each_with_index_floe do |item, i, floe|
        floe.even?.should == [:a, :c, :e].include?(item)
      end
    end

    it "returns an enumerator" do
      a5.each_with_index_floe.should be_an_instance_of enumerator
    end

    it "iterates on the array entries" do
      a5.each_with_index_floe.collect{|item, i, floe| item}.should == a5
    end

    it "constructs floe strings" do
      a5.each_with_index_floe.collect{ |item, i, floe| floe.to_s }.should == [
        "first even",
        "odd",
        "even",
        "odd",
        "last even"
      ]
    end

    it "constructs floe string with first last and even when size == 1" do
      a1.each_with_index_floe.collect{|item, i, floe| floe.to_s}.should == [ "first last even" ]
    end

  end

end
