defmodule TestingModule do
  def start_periodic_timer do
    {:ok, _pid} = PeriodicTimer.start_link()
    PeriodicTimer.start_timer(1000, fn ->
      IO.puts("Timer triggered!")
      :ok
    end)
  end

  def cancel_timer do
    PeriodicTimer.cancel_timer()
  end
end
