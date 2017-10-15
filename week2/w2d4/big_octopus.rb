def sluggish(arr)
  longest = ""
  arr.each do |el|
    arr.each do |el2|
      if el.length > el2.length && el.length > longest.length
        longest = el
      end
    end
  end
end

def dominant(arr)
  merge_sort(arr)[0]
end

def merge_sort(arr)
  return arr if arr.length <= 1
  mid = arr.length / 2
  left = merge_sort(arr.take(mid))
  right = merge_sort(arr.drop(mid))
  merge(left, right)
end

def merge(arr1, arr2)
  result = []
  until arr1.empty? || arr2.empty?
    if arr1.first.length < arr2.first.length
      result << arr1.shift
    else
      result << arr2.shift
    end
  end
  result + arr1 + arr2
end

def clever(arr)
  longest = ""
  arr.each { |el| longest = el if el.length > longest.length }
  longest
end

def slow_dance(dir, arr)
  arr.each_with_index { |el, i| return i if el == dir }
end

def fast_dance(dir, hash)
  hash[dir]
end
