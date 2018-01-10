# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to

require_relative "graph"
require_relative "topological_sort"

def install_order(arr)
  vertices = []
  arr.each do |el|
    vertices << Vertex.new(el[0])
  end

  arr.each_with_index do |el, i|
  end
end
