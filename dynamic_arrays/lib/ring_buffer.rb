require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    @length = 0
    @array = StaticArray.new(@length)
    @capacity = 8
    @start_idx = 0
  end

  # O(1)
  def [](index)
    check_index(index)
    @array[(index + @start_idx) % @capacity]
  end
  
  # O(1)
  def []=(index, val)
    check_index(index)
    @array[index] = val
  end

  # O(1)
  def pop
    raise "index out of bounds" if @length <= 0
    @length -= 1
    @array[(@start_idx + @length) % @capacity]
  end

  # O(1) ammortized
  def push(val)
    @length += 1
    @capacity *= 2 if @length > @capacity
    @array[(@length + @start_idx - 1) % @capacity] = val
  end

  # O(1)
  def shift
    raise "index out of bounds" if @length <= 0
    @start_idx = (@start_idx + 1) % @capacity
    @length -= 1
    @array[(@start_idx - 1) % @capacity]
  end

  # O(1) ammortized
  def unshift(val)
    @length += 1
    @capacity *= 2 if @length > @capacity
    @start_idx = (@start_idx - 1) % @capacity
    @array[@start_idx] = val
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
    raise "index out of bounds" if index > @length - 1
  end

  def resize!
  end
end
