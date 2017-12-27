# Implement a queue with #enqueue and #dequeue, as well as a #max API,
# a method which returns the maximum element still in the queue. This
# is trivial to do by spending O(n) time upon dequeuing.
# Can you do it in O(1) amortized? Maybe use an auxiliary storage structure?

# Use your RingBuffer to achieve optimal shifts! Write any additional
# methods you need.

require_relative 'ring_buffer'

class QueueWithMax
  attr_accessor :store

  def initialize
    @array = RingBuffer.new
  end

  def enqueue(val)
    if @array.length.zero?
      @array.push([val, val])
    elsif @array[@array.length - 1][1] > val
      @array.push([val, @array[@array.length - 1][1]])
    else
      @array.push([val, val])
    end
  end

  def dequeue
    @array.pop
  end

  def max
    p @array
    @array[@array.length - 1][1]

  end

  def length
    @array.length
  end
end

# Previous Version of code
  # def enqueue(val)
  #   prev_max = @max_array[length - 1]

  #   if @max_array.length.zero?
  #     @max_array.push(val)
  #   elsif prev_max > val
  #     @max_array.push(prev_max)
  #   else
  #     @max_array.push(val)
  #   end

  #   @array.push(val)
  #   # p "enqueue"
  #   # p @array
  #   # p "max"
  #   # p @max_array
  # end

  # def dequeue
  #   @max_array.pop
  #   @array.pop
  #   p "dequeue"
  #   p @array
  #   p "max"
  #   p @max_array
  # end

  # def max
  #   p "length"
  #   p length
  #   p "max val"
  #   p @max_array[length - 1]
  # end

  # def length
  #   @array.length
  # end

