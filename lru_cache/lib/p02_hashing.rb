class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    total = 0
    self.each do |el|
      total = (total + el.hash).hash
    end
    total.hash
  end
end

class String
  def hash
    letters = ("a".."z").to_a.concat(("A".."Z").to_a)
    total = 0
    self.each_char do |el|
      total = (total + letters.index(el).hash).hash
    end
    total.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    total = 0
    self.values.each do |el|
      total = total ^ el.hash
    end
    total.hash
  end
end
