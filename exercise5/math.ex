defmodule Math do
  def add(x, y) do
    info("Adding #{x} and #{y}")
    x + y
  end

  def sub(x, y) do
    info("Subtraking #{x} and #{y}")
    x - y
  end

  def mul(x, y) do
    info("Multiplying #{x} and #{y}")
    x * y
  end

  def div(x, y) do
    info("Dividing #{x} and #{y}")
    x / y
  end

  defp info(message) do
    IO.puts(message)
  end
end
