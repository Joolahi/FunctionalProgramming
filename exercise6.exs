defmodule Employee do
  defstruct first_name: "",
            last_name: "",
            id_number: nil,
            salary: 0,
            job: :none

  def new_employee(first_name, last_name, job \\ :none) do
    %Employee{
      first_name: first_name,
      last_name: last_name,
      id_number: generate_id(),
      job: job
    }
  end

  defp generate_id() do
    employees = Agent.get(:employees, fn _ -> [] end)
    max_id = case employees do
      [] -> 0
      _ -> Enum.max(Enum.map(employees, & &1.id_number))
    end
    max_id + 1
  end

  def promote(%Employee{} = employee) do
    updated_job = case employee.job do
      :none -> :coder
      :coder -> :designer
      :designer -> :manager
      :manager -> :ceo
      _ -> employee.job
    end

    updated_salary = case updated_job do
      :none -> 0
      _ -> employee.salary + 2000
    end

    %{employee | job: updated_job, salary: updated_salary}
  end

  def demote(%Employee{} = employee) do
    updated_job = case employee.job do
      :ceo -> :manager
      :manager -> :designer
      :designer -> :coder
      :coder -> :none
      _ -> employee.job
    end

    updated_salary = case updated_job do
      :none -> 0
      _ -> employee.salary - 2000
    end

    %{employee | job: updated_job, salary: updated_salary}
  end
end

Agent.start_link(fn -> [] end, name: :employees)


# Create a new employee
firstEmployee = Employee.new_employee("Jarkko", "Koto", :coder)
secondEmployee = Employee.new_employee("Hanna", "Kittilä", :ceo)

# Promote the employee
employeePromote = Employee.promote(firstEmployee)

# Demote the employee
employeeDemote = Employee.demote(secondEmployee)

IO.inspect(firstEmployee)
IO.inspect(employeePromote)
IO.inspect(secondEmployee)
IO.inspect(employeeDemote)
