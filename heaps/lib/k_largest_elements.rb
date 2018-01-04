require_relative 'heap'

def k_largest_elements(array, k)
  prc = Proc.new do |el1, el2|
    -1 * (el1 <=> el2)
  end

  (2 * k).times do |i|
    pos = array.length - i - 1
    array = BinaryMinHeap.heapify_up(array, pos, array.length, &prc)
  end

  result = []
  k.times do |i|
    result << array[0]
    array[0], array[-1] = array[-1], array[0]
    array.pop
    BinaryMinHeap.heapify_down(array, 0, array.length, &prc)
  end

  result
end
