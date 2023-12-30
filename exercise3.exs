#Part 1
inputStr = IO.gets("Enter a number\n")
num = String.to_integer(String.replace(inputStr, "\n", ""))
smallestDivisors = Enum.filter(Enum.to_list(2..num), fn x -> rem(num, x) == 0 end)
smallestDivisor = List.first(smallestDivisors)

cond do
  rem(num, 3) == 0 -> IO.puts("Divisible by 3")
  rem(num, 5) == 0 -> IO.puts("Divisible by 5")
  rem(num, 7) == 0 -> IO.puts("Divisible by 7")
  smallestDivisor > 1  -> IO.puts("Smallest divisor is: #{smallestDivisor}")
end

#Part 2
combine_or_add = fn
  (param1, param2) when is_binary(param1) and is_binary(param2) ->
    IO.puts("Both parameters are strings.")
    param1 <> param2

  (param1, param2) when is_number(param1) and is_number(param2) ->
    IO.puts("Both parameters are numbers.")
    param1 + param2

  (_, _) ->
    IO.puts("Parameters are of different types.")
    nil
end

# Test the anonymous function with string parameters
result1 = combine_or_add.("Hello, ", "World!")
IO.puts("Result 1: #{inspect(result1)}")

# Test the anonymous function with number parameters
result2 = combine_or_add.(10, 20)
IO.puts("Result 2: #{inspect(result2)}")

# Test the anonymous function with mixed types
result3 = combine_or_add.("Hello, ", 42)
IO.puts("Result 3: #{inspect(result3)}")
