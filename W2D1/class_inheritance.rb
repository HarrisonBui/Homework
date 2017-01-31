class Employee

  attr_accessor :name, :title, :salary

  def initialize(name, title, salary)
    @name, @title, @salary = name, title, salary
  end

  def boss=(boss)
    boss.employees << self
    @boss = boss
  end

  def bonus(multiplier)
    bonus = (salary) * multiplier
  end
end

class Manager < Employee

  attr_accessor :employees

  def initialize(name, title, salary)
    super
    @employees = []
  end

  def bonus(multiplier)
    total = 0
    employees.each do |ele|
      if ele.is_a?(Manager)
        total += ele.bonus(1) + ele.salary
      else
        total += ele.salary
      end
    end
    total * multiplier
  end

end
