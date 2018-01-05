require_relative "heap"

class Array
  def heap_sort!
    arr = self

    # return arr if arr == arr.sort

    arr.each_index do |i|
      # next if i.zero?
      arr = BinaryMinHeap.heapify_up(arr, arr.length - i - 1)
    end

    (arr.length).times do |i|
      lastIdx = arr.length - i - 1
      p "before switch"
      p arr
      arr[0], arr[lastIdx] = arr[lastIdx], arr[0]
      p "after switch"
      p arr
      arr = BinaryMinHeap.heapify_down(arr, 0, lastIdx)
      p "after heapify"
      p arr
    end

    arr.reverse!
  end
end
