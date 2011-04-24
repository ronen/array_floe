module ArrayFloe

  # The class for the "floe" object constructed by
  # Array#each_with_floe and Array#each_with_index_floe
  class Floe
    def initialize(i, size) # :nodoc:
      @first = i == 0
      @last = i == size -1
      @odd = i.odd?
    end

    # Returns true for the first element
    def first? 
      @first
    end

    # Returns true for the last element
    def last?
      @last
    end

    # Returns true for odd-numbered elements
    def odd?
      @odd
    end

    # Returns true for even-numbered elements
    def even?
      !@odd
    end

    # Returns a space-separated list of "first", "last", "odd", and "even"
    # as appropriate for the current element.
    def to_s
      @str ||= [@first && "first", @last && "last", @odd ? "odd" : "even"].select{|x| x}.join(' ')
    end
  end
end
