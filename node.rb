class Node
  attr_accessor :parent, :left_child, :right_child, :value

  def initialize(options = {})
    options = {value: nil, parent: nil, left_child: nil, right_child: nil}.merge(options)

    @parent = options[:parent]
    @left_child = options[:left_child]
    @right_child = options[:right_child]
    @value = options[:value]
  end


  def add_child(direction, new_child)
    current_child = get_child_on(direction) 
    current_child.remove_parent if current_child
    remove_child(direction) if current_child
    new_child.parent.id_and_remove_child(new_child) if new_child.parent 
    new_child.add_parent(self)
    set_child_on(direction, new_child)
  end

  protected

  def get_child_on(direction)
    self.send("#{direction}_child")
  end

  def set_child_on(direction, new_child)
    self.send("#{direction}_child=", new_child)
  end

  def remove_parent
    self.parent = nil
  end

  def remove_right_child
    self.right_child = nil
  end

  def remove_child(direction)
    self.send("#{direction}_child=", nil)
  end

  def id_and_remove_child(child) 
    if left_child == child
      remove_child(:left)
    elsif right_child == child
      remove_child(:right)
    end
  end

  def add_parent(new_parent)
    self.parent = new_parent
  end
end
