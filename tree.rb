require_relative './node'

class BinaryTree
  def self.build(levels=4, start_val=0)
    value = start_val
    root = Node.new(value: value)
    nodes = [root]

    (levels - 1).times do |n| 
      new_nodes = []

      while nodes.length > 0
        current_node = nodes.pop

        value += 1
        node1 = Node.new(value: value) 
        current_node.add_child(:left, node1)
        new_nodes << node1

        value += 1
        node2 = Node.new(value: value) 
        current_node.add_child(:right, node2)
        new_nodes << node2
      end

      nodes.concat(new_nodes)
    end

    BinaryTree.new(root)
  end

  def initialize(root)
    @root = root 
  end

  def levels(node, count = 0)
    return count if node.nil?
    count += 1
    levels(node.left_child, count)
  end

  def count_levels
    levels(@root)
  end

  def dfs(target, node = @root)
    return node if node.value == target
    return nil unless node.left_child || node.right_child

    left_result = dfs(target, node.left_child)
    return left_result if left_result

    return dfs(target, node.right_child)
  end

  def bfs(target)
    nodes = [@root]
    result = nil

    until nodes.length == 0 || result 
      new_nodes = []
        until nodes.length == 0 || result 
          current_node = nodes.pop

          if current_node.value == target
            result = current_node
          else
            new_nodes << current_node.left_child if current_node.left_child
            new_nodes << current_node.right_child if current_node.right_child
          end
        end

      nodes.concat(new_nodes)
    end

    result
  end
end
