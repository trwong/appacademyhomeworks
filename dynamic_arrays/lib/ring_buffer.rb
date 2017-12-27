require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    @length = 0
    @capacity = 8
    @store = StaticArray.new(@capacity)
    @start_idx = 0
  end

  # O(1)
  def [](index)
    check_index(index)
    @store[(index + @start_idx) % @capacity]
  end
  
  # O(1)
  def []=(index, val)
    check_index(index)
    @store[index] = val
  end

  # O(1)
  def pop
    raise "index out of bounds" if @length <= 0
    @length -= 1
    prev_val = @store[(@start_idx + @length) % @capacity]
    @store[(@start_idx + @length) % @capacity] = nil
    prev_val
  end

  # O(1) ammortized
  def push(val)
    @length += 1
    resize!
    @store[(@length + @start_idx - 1) % @capacity] = val
  end

  # O(1)
  def shift
    raise "index out of bounds" if @length <= 0
    @start_idx = (@start_idx + 1) % @capacity
    @length -= 1
    @store[(@start_idx - 1) % @capacity]
  end

  # O(1) ammortized
  def unshift(val)
    @length += 1
    resize!
    @start_idx = (@start_idx - 1) % @capacity
    @store[@start_idx] = val
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
    raise "index out of bounds" if index > @length - 1
  end

  def resize!
    if @length > @capacity
      new_store = StaticArray.new(@capacity * 2)
      @length.times do |i|
        new_store[i] = @store[(i + @start_idx) % @capacity ]
      end
      @start_idx = 0
      @capacity *= 2
      @store = new_store
    end
  end
end
