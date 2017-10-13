class LRUCache
   def initialize(size)
     @size = size
     @cache = []
   end

   def count
     # returns number of elements currently in cache
     @cache.count
   end

   def add(el)
     # adds element to cache according to LRU principle
    if @cache.include?(el)
      @cache.delete(el)
    elsif @cache.count >= @size
       @cache.shift
     end
     @cache.push(el)
   end

   def show
     # shows the items in the cache, with the LRU item first
     print @cache
     puts
   end

   private
   # helper methods go here!

 end

l = LRUCache.new(3)
l.show
l.add(1)
l.add(2)
l.add(3)
l.show
l.add(1)

l.show
