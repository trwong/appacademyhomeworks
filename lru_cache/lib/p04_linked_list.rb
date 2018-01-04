class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous node to next node
    # and removes self from list.
    @prev.next = @next
    @next.prev = @prev
  end
end

class LinkedList
  def initialize
    @head = Node.new()
    @tail = Node.new()

    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    # each_with_index { |node, j| return node if i == j }
    # nil
    el = first
    index = 0
    while true
      if i == index
        return el
      elsif el.next == nil
        break
      else
        el = el.next
        index += 1
      end
    end
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    el = first
    while true
      if el.key == key
        return el.val
      elsif el.next == nil
        return nil
      else
        el = el.next
      end
    end
  end

  def include?(key)
    el = first
    while true
      if el.key == key
        return true
      elsif el.next == nil
        break
      else
        el = el.next
      end
    end
    false
  end

  def append(key, val)
    last.next = Node.new(key, val)
    @tail.prev = last.next
  end

  def update(key, val)
    el = first
    until el.next == nil || el.key == key
      el = el.next
    end
    if el.key == key
      el.val = val
    end
  end

  def remove(key)
    el = first
    while true
      if el.next == nil
        break
      elsif el.key == key
        elPrev = el.prev
        el.prev = el.next
        el.next = elPrev
        break
      else
        el = el.next
      end
    end
  end

  def each
    el = first
    while true
      # if el.next == nil
      if el.prev == @last
        break
      else
        yield(el)
        el = el.next
      end
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  # end
end
