def sum_to(n)
  return nil if n < 1
  return 1 if n == 1
  return n + sum_to(n - 1)
end

 p sum_to(5)  ==  15
 p sum_to(1)  ==  1
 p sum_to(9)  ==  45
 p sum_to(-8)  ==  nil

def add_numbers(arr)
  return arr.first if arr.length <= 1
  return arr.first + add_numbers(arr[1..-1])
end

 # Test Cases
 p  add_numbers([1,2,3,4]) ==  10
 p  add_numbers([3]) ==  3
 p  add_numbers([-80,34,7]) ==  -39
 p  add_numbers([]) ==  nil

def gamma_fnc(n)
  return nil if n <= 0
  n -= 1
  factorial(n)
end

def factorial(n)
  return 1 if n <= 1
  return n * factorial(n - 1)
end

 # Test Cases
 p gamma_fnc(0)  ==  nil
 p gamma_fnc(1)  ==  1
 p gamma_fnc(4)  ==  6
 p gamma_fnc(8)  ==  5040


def ice_cream_shop(flavors, favorite)
  return false if flavors.empty?
  available = flavors.first == favorite
  return available || ice_cream_shop(flavors[1..-1], favorite)
end

 # Test Cases
 p  ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  ==  false
 p  ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  ==  true
 p  ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  ==  false
 p  ice_cream_shop(['moose tracks'], 'moose tracks')  ==  true
 p  ice_cream_shop([], 'honey lavender')  ==  false

def reverse(string)
  return string if string.length <= 1
  return reverse(string[1..-1]) + string[0]
end

 # Test Cases
p reverse("house") == "esuoh"
p reverse("dog") == "god"
p reverse("atom") == "mota"
p reverse("q") == "q"
p reverse("id") == "di"
p reverse("") == ""
