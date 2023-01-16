defmodule ToyRobot do
  @moduledoc """
  Documentation for `ToyRobot`.
  """

  use GenServer

  @directions [:east, :south, :west, :north]

  # Client

  def start_link(_opts) do
    GenServer.start_link(ToyRobot, :ok, name: ToyRobot)
  end

  def place(x, y, f) do
    GenServer.cast(ToyRobot, {:place, x, y, f})
  end

  def move do
    GenServer.call(ToyRobot, :move)
  end

  def left do
    GenServer.call(ToyRobot, :left)
  end

  def right do
    GenServer.call(ToyRobot, :right)
  end

  def report do
    GenServer.call(ToyRobot, :report)
  end

  # Server / Callbacks

  def init(:ok) do
    {:ok, {0, 0, :east}}
  end

  def handle_cast({:place, x, y, f}, _state) do
    {:noreply, {x, y, f}}
  end

  def handle_call(:move, _from, {x, y, f}) do
    {:reply, :ok, move_position({x, y, f})}
  end

  def handle_call(:left, _from, {x, y, f}) do
    {:reply, :ok, {x, y, update_face(f, :left)}}
  end

  def handle_call(:right, _from, {x, y, f}) do
    {:reply, :ok, {x, y, update_face(f, :right)}}
  end

  def handle_call(:report, _from, state) do
    {:reply, state, {0, 0, :east}}
  end

  def update_face(face, change_direction) do
    index =
      @directions
      |> Enum.find_index(&(&1 == face))
      |> change_direction(change_direction)
      |> rem(4)

    Enum.at(@directions, index)
  end

  def change_direction(index, :left), do: index - 1
  def change_direction(index, :right), do: index + 1

  def move_position({x, y, :east = f}), do: {x + 1, y, f}
  def move_position({x, y, :west = f}), do: {x - 1, y, f}
  def move_position({x, y, :north = f}), do: {x, y + 1, f}
  def move_position({x, y, :south = f}), do: {x, y - 1, f}
end
