class TestClass
  attr_accessor :parent

  def initialize
    @parent = AnotherClass.new
  end
end

class AnotherClass
  def initialize
    @value = "blah"
  end
end
