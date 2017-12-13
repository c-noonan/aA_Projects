class Employee
  attr_reader :salary

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    @bonus = @salary * multiplier
  end
end

class Manager < Employee
  attr_reader :bonus, :employees

  def initialize(employees = [], name, title, salary, boss)
    @employees = employees
    super(name, title, salary, boss)
  end

  def bonus(multiplier)
    bonus = []
    @employees.each { |employee| bonus << employee.salary }
    bonus = bonus.inject(:+)
    @bonus = bonus * multiplier
  end


end

shawna = Employee.new("shawna", "TA", 12000, "darren")
david = Employee.new("david", "TA", 10000, "darren")
darren = Manager.new([david, shawna], "darren", "TA manager", 78000, "ned")
