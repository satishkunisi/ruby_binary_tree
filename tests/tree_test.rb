require 'minitest/autorun'
require_relative '../tree'
require_relative '../node'

class TreeTest < Minitest::Unit::TestCase
  def setup
    @tree = BinaryTree.build(4)
  end

  def test_count_levels
    assert @tree.count_levels == 4
  end

  def test_dfs
    14.times do |n|
      node = @tree.dfs(n)
      assert node.value == n 
    end
  end

  def test_bfs
    14.times do |n|
      node = @tree.bfs(n)
      assert node.value == n 
    end
  end
end
