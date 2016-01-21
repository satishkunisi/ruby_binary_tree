require 'minitest/autorun'
require_relative '../node'

class TestNode < MiniTest::Unit::TestCase
  def setup
    @node = Node.new
  end

  def parent
    @parent = Node.new
  end

  def test_responds_to_parent
    assert @node.respond_to?(:value)  
  end

  def test_responds_to_parent
    assert @node.respond_to?(:parent)  
  end

  def test_responds_to_left_child
    assert @node.respond_to?(:left_child)  
  end

  def test_responds_to_right_child
    assert @node.respond_to?(:right_child)  
  end

  def setup_add_child_test
    @old_child = Node.new
    @parent = Node.new(right_child: @old_child)
    @old_parent = Node.new
    @new_child = Node.new(parent: @old_parent)

    @parent.add_child(:right, @new_child)
  end

  def test_parent_removed
    setup_add_child_test
    assert @old_child.parent.nil?
  end

  def test_old_parent_child_removed
    setup_add_child_test
    assert @old_parent.right_child.nil?
  end

  def test_new_child_has_new_parent
    setup_add_child_test
    assert @new_child.parent == @parent
  end
end
