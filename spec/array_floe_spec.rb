require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "ArrayFloe" do

  let (:a1) { Array(0...1) }
  let (:a5) { Array(0...5) }

  ["each_with_floe", "each_with_index_floe"].each do |method|

    context method do

      it "has correct arity" do
        a5.send(method) do |*args|
          args.size == (method == "each_with_index_floe" ? 3 : 2)
        end
      end

      it "correctly reports first" do
        a5.send(method) do |*args|
          item = args.first
          floe = args.last
          floe.first?.should == (item == 0)
        end
      end

      it "correctly reports last" do
        a5.send(method) do |*args|
          item = args.first
          floe = args.last
          floe.last?.should == (item == 4)
        end
      end

      it "correctly reports odd" do
        a5.send(method) do |*args|
          item = args.first
          floe = args.last
          floe.odd?.should == (item % 2  == 1)
        end
      end

      it "correctly reports even" do
        a5.send(method) do |*args|
          item = args.first
          floe = args.last
          floe.even?.should == (item % 2  == 0)
        end
      end

      it "returns an enumerator" do
        a5.send(method).should be_an_instance_of Enumerable::Enumerator
        a5.send(method).find{|args| args.last.last? }.first.should == 4
      end

      it "iterates on the array entries" do
        a5.send(method).collect(&:first).should == a5
      end

      if method == "each_with_index_floe"
        it "passes the index" do
          a5.send(method).collect{|args| args[1]}.should == a5
        end
      end

      it "constructs floe strings" do
        a5.send(method).collect{ |args| args.last.to_s }.should == [
          "first even",
          "odd",
          "even",
          "odd",
          "last even"
        ]
      end

      it "constructs first and last floe string when size == 1" do
        a1.send(method).collect{|args| args.last.to_s}.should == [ "first last even" ]
      end

    end

  end

end
