defmodule ToyRobotTest do
  use ExUnit.Case

  describe "Toy Robot" do
    test "place" do
      assert ToyRobot.place(1, 2, :east) == :ok
    end

    test "place report" do
      ToyRobot.place(4, 3, :south)
      assert ToyRobot.report() == {4, 3, :south}
    end

    test "place right report" do
      ToyRobot.place(2, 2, :west)
      ToyRobot.right()

      assert ToyRobot.report() == {2, 2, :north}
    end

    test "place left report" do
      ToyRobot.place(0, 0, :north)
      ToyRobot.left()

      assert ToyRobot.report() == {0, 0, :west}
    end

    test "place move report" do
      ToyRobot.place(2, 1, :north)
      ToyRobot.move()

      assert ToyRobot.report() == {2, 2, :north}
    end

    test "place move move left move report" do
      ToyRobot.place(1, 2, :east)
      ToyRobot.move()
      ToyRobot.move()
      ToyRobot.left()
      ToyRobot.move()

      assert ToyRobot.report() == {3, 3, :north}
    end
  end
end
