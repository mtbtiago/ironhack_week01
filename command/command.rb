class Car
  attr_reader :position
  def initialize
    @position = 0
    puts @position
  end

  def setposition(newposition)
    @position = newposition
    puts @position
  end
end

class Movehorizontal
  def initialize(length)
    @length = length
  end

  def execute(car)
    car.setposition(car.position + @length)
  end

  def unexecute(car)
    car.setposition(car.position - @length)
  end
end

class Stack
  def initialize(car)
    @history = []
    @car = car
  end

  def execute(command)
    command.execute(@car)
    @history << command 
  end

  def unexecute
    # if @history.isemptyp

    @history[@history.length - 1].unexecute(@car)
    @history.pop
  end
end

  car = Car.new
  stack = Stack.new(car)
  stack.execute(Movehorizontal.new(10))
  stack.execute(Movehorizontal.new(15))
  stack.execute(Movehorizontal.new(7))
  stack.unexecute()
  stack.unexecute()
  stack.unexecute() 
 