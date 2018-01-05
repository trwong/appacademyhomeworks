class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length <= 1

    pivot_idx = array.length / 2
    pivot = array[ pivot_idx ]
    left = []
    right = []
    
    array.each_with_index do |el, i|
      next if pivot_idx == i
      if el < pivot
        left << el
      else
        right << el
      end
    end

    QuickSort.sort1(left) + [pivot] + QuickSort.sort1(right)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    return if length <= 1
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }
    pivot_idx = QuickSort.partition(array, start, length, &prc)
    QuickSort.sort2!(array, start, pivot_idx - start, &prc)
    QuickSort.sort2!(array, pivot_idx + 1, length - pivot_idx - 1, &prc)
  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }

    pivot = array[start]
    partition_idx = start

    (start...start + length).each do |idx|
      next if idx == start
      if prc.call(pivot, array[idx]) == 1
        if idx == partition_idx + 1
          partition_idx += 1
        else
          partition_idx += 1
          array[idx], array[partition_idx] = array[partition_idx], array[idx]
        end
      end
    end

    array[start], array[partition_idx] = array[partition_idx], array[start]
    partition_idx
  end
end
