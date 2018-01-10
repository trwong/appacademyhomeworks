require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  sorted = []
  queue = []
  vertices.each do |vertex|
    queue << vertex if vertex.in_edges.empty?
  end

  until queue.empty?
    current_vert = queue.shift
    sorted << current_vert
    current_vert.out_edges.each do |edge|
      if edge.to_vertex.in_edges.length == 1
        queue << edge.to_vertex
      end
    end
    current_vert.out_edges.each do |edge|
      edge.destroy!
    end
  end

  return [] if sorted.length < vertices.length
  sorted
end
