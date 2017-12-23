require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @array = StaticArray.new(0)
    @length = 0
    @capacity = 8
  end

  # O(1)
  def [](index)
    raise "index out of bounds" if index > @length - 1
    @array[index]
  end

  # O(1)
  def []=(index, value)
    raise "index out of bounds" if index > @length - 1
    @array[index] = value
  end

  # O(1)
  def pop
    raise "index out of bounds" if @length == 0
    @length -= 1
    # @array[@length] = nil
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    @length += 1
    resize!
    @array[@length - 1] = val
  end

  # O(n): has to shift over all the elements.
  def shift
    raise "index out of bounds" if @length == 0
    (0...@length).each do |i|
      @array[i] = @array[i + 1]
    end
    @length -= 1
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    @length += 1
    (1...@length).to_a.reverse.each do |i|
      @array[i] = @array[i - 1]
    end
    resize!
    @array[0] = val
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    @capacity *= 2 if length > capacity
  end
end
