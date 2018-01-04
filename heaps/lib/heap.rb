class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    prc ||= Proc.new do |el1, el2|
      el1 <=> el2
    end
    @store = []
  end

  def count
    @store.length
  end

  def extract
    first = @store[0]
    @store[0], @store[-1] = @store[-1], @store[0]
    @store.pop
    BinaryMinHeap.heapify_down(@store, 0)
    first
  end

  def peek
    @store.last
  end

  def push(val)
    @store << val
    BinaryMinHeap.heapify_up(@store, @store.length - 1)
  end

  public

  def self.child_indices(len, parent_index)
    return [1, 2] if parent_index == 0
    if parent_index * 2 + 2 < len
      return [parent_index * 2 + 1, parent_index * 2 + 2]
    else
      return [parent_index * 2 + 1]
    end
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index.zero?
    (child_index - 1) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc ||= Proc.new do |el1, el2|
      el1 <=> el2
    end

    children_arr = BinaryMinHeap.child_indices(len, parent_idx)
    if children_arr.length == 1 || prc.call(array[children_arr[0]],array[children_arr[1]]) == -1
      child = children_arr[0] 
    else
      child = children_arr[1]
    end

    return array if child > len - 1
    
    array[child], array[parent_idx] = array[parent_idx], array[child]

    BinaryMinHeap.heapify_down(array, child, len, &prc)
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    prc ||= Proc.new do |el1, el2|
      el1 <=> el2
    end

    return array if child_idx == 0
    parent = BinaryMinHeap.parent_index(child_idx)
    if prc.call(array[parent], array[child_idx]) == 1
      array[parent], array[child_idx] = array[child_idx], array[parent]
    else
      return array
    end

    BinaryMinHeap.heapify_up(array, parent, len, &prc)
  end
end
