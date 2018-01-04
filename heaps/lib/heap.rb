class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    prc ||= Proc.new do |el1, el2|
      el1 <=> el2
    end
    @store = []
  end

  def count
  end

  def extract
  end

  def peek
  end

  def push(val)
  end

  public
  def self.child_indices(len, parent_index)
    if parent_index == 0
      return [1, 2] 
    elsif len.even?
      return [(parent_index * 2) + 1]
    else
      return [(parent_index * 2) + 1, (parent_index * 2) + 2]
    end
  end

  def self.parent_index(child_index)
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
  end
end
