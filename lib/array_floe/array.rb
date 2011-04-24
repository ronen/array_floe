require 'enumerator' unless defined?(Enumerator)

module ArrayFloe
  module Array
    
    # For each element in the array, calls the block with two arguments: the
    # element and a "floe" object.
    #
    #    ary.each_with_floe do |element, floe|
    #      if floe.first?
    #          puts "#{element} is the first element"
    #      end
    #      if floe.last?
    #          puts "#{element} is the last element"
    #      end
    #      if floe.odd?
    #          puts "#{element} is an odd-numbered element"
    #      end
    #      if floe.even?
    #          puts "#{element} is an even-numbered element"
    #      end
    #  end
    #
    # If no block is given, an enumerator is returned instead.
    def each_with_floe() # :yields: element, floe
      if block_given?
        each_with_index do |element, i|
          yield(element, Floe.new(i, size))
        end
      else
        to_enum(:each_with_floe)
      end
    end

    # For each element in the array, calls the block with three arguments: the
    # element, its index, and a "floe" object.
    #
    #   ary.each_with_index_floe do |element, i, floe|
    #       assert_equal(i == 0,        floe.first?)
    #       assert_equal(i == ary.last, floe.last?)
    #       assert_equal(i % 2 == 1,    float.odd?)
    #       assert_equal(i % 2 == 1,    float.even?)
    #   end
    #
    # If no block is given, an enumerator is returned instead.
    def each_with_index_floe() # :yields: element, i, floe
      if block_given?
        each_with_index do |element, i|
          yield(element, i, Floe.new(i, size))
        end
      else
        to_enum(:each_with_index_floe)
      end
    end
  end
end

