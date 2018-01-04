require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(val)
    @count += 1
    resize! if @count > num_buckets
    @store[val.hash % num_buckets] << val
  end

  def include?(val)
    @store[val.hash % num_buckets].include?(val)
  end

  def remove(val)
    @count -= 1
    @store[val.hash % num_buckets].delete(val)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(num_buckets * 2) { Array.new }
    @store.each do |array|
      array.each do |el|
        new_store[el.hash % (num_buckets * 2)] = el
      end
    end

    @store = new_store
  end
end
