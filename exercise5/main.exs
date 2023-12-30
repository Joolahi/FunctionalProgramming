loop = fn loop_func ->
  u_input = String.trim_trailing(IO.gets("Enter calculation: "), "\n")

  try do
    Calculator.calc(u_input)
    loop_func.(loop_func)
  rescue
    ArgumentError -> IO.puts("Invalid input, quitting... ")
  end
end

loop.(loop)
