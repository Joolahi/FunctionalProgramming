defmodule Calculator  do
  def calc(input) do
    inputNumbers = String.split(input, ["+", "-", "/", "*"])
  x = String.to_integer(List.first(inputNumbers))
  y = String.to_integer(List.last(inputNumbers))

  operator = String.at(input, String.length(List.first(inputNumbers)))
  result = case operator do
    "+" -> Math.add(x,y)
    "-" -> Math.sub(x,y)
    "*" -> Math.mul(x,y)
    "/" -> Math.div(x,y)
    _ -> "Invalid operator"
  end

  IO.puts("Result: #{result}")
  end
end
