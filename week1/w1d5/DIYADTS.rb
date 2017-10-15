class Stack
    def initialize
      # create ivar to store stack here!
      @ivar = []
    end

    def add(el)
      # adds an element to the stack
      @ivar.push(el)
    end

    def remove
      # removes one element from the stack
      @ivar.pop
    end

    def show
      # return a copy of the stack
      print @ivar
    end
  end

class Que
  def initialize
    @ivar = []
  end

  def enqueue(el)
    @ivar.push(el)
  end

  def dequeue
    @ivar.shift
  end

  def show
    print @ivar
  end
end

class Map
  def initialize
    @arr = []
  end

  def assign(key, value)
    @arr << [key, value]
  end

  def lookup(key)
    @arr.select { |array| array[0] == key }.last
  end

  def remove(key)
    @arr = @arr.reject { |array| array[0] == key }
  end

  def show
    print @arr
  end
end
