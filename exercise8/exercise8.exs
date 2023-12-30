defmodule PeriodicTimer do
  use GenServer


  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  def start_timer(period_ms, callback_fun) do
    GenServer.call(__MODULE__, {:start_timer, period_ms, callback_fun})
  end

  def cancel_timer do
    GenServer.cast(__MODULE__, :cancel_timer)
  end


  def init(opts) do
    {:ok, %{timers: %{}, timer_ref: nil}}
  end

  def handle_call({:start_timer, period_ms, callback_fun}, _from, state) do
    case state.timer_ref do
      nil ->
        timer_ref = start_periodic_timer(period_ms, callback_fun)
        {:reply, :ok, %{state | timer_ref: timer_ref}}

      _ ->
        {:reply, :error, state}
    end
  end

  def handle_cast(:cancel_timer, state) do
    case state.timer_ref do
      nil ->
        {:noreply, state}

      timer_ref ->
        :timer.cancel(timer_ref)
        {:noreply, %{state | timer_ref: nil}}
    end
  end

  defp start_periodic_timer(period_ms, callback_fun) do
    timer_ref = :timer.send_interval(period_ms, self(), :timer_tick)
    spawn_link(fn ->
      loop(timer_ref, callback_fun)
    end)
    timer_ref
  end

  defp loop(timer_ref, callback_fun) do
    receive do
      :timer_tick ->
        result = callback_fun.()
        case result of
          :cancel ->
            :timer.cancel(timer_ref)

          :ok ->
            loop(timer_ref, callback_fun)
        end
    end
  end
