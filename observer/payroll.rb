class Payroll
  def update( changed_employee )
    puts("Cut a new check for #{changed_employee.name}!")
    puts("His salary is now #{changed_employee.salary}!")
  end
end

class RRHH
  def update( changed_employee )
    puts("We need to pay more to #{changed_employee.name}!")
    puts("His salary is now #{changed_employee.salary}!")
  end
end

class Employee
  attr_reader :name, :title
  attr_reader :salary
  def initialize( name, title, salary)
    @name = name
    @title = title
    @salary = salary
    @observers = []
  end
  def add_observer(observer)
    @observers << observer
  end
  def salary=(new_salary)
    @salary = new_salary
    @observers.each do |observer|
      observer.update(self)
    end
  end
end

payroll = Payroll.new
rrhh = RRHH.new
fred = Employee.new('Fred', 'Crane Operator', 30000)
fred.add_observer(payroll)
fred.add_observer(rrhh)
fred.salary = 35000
