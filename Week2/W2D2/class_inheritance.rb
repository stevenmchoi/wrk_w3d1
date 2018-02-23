require 'byebug'

class Employee

  attr_reader :name, :title, :salary, :boss
  attr_writer :boss

  def initialize(name, title, salary, boss)
    @name = name
    @salary = salary
    @title = title
    @boss = boss

  end

  def bonus(multiplier)
    salary * multiplier
  end
end

class Manager < Employee

  attr_reader :reports

  def initialize(name, title, salary, boss, reports)
    super(name, title, salary, boss)
    @reports = reports
  end

  def bonus(multiplier)
    debugger
    (bonus_calc(reports, 0)+salary) * multiplier
  end

  private
  def bonus_calc(employee_list, val)
    # return val if employee_list.empty?

    employee_list.each do |emp|
      if emp.is_a?(Manager)
        val += bonus_calc(emp.reports, val)
      else
        return val += emp.salary
      end
    end
  end

end
