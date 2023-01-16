# Toy Robot Simulator

**TODO: Add description**

Toy Robot Simulator [Problem](PROBLEM.md) Solution in Elixir

## Prerequisite
  - Elixir

## Run

```bash
iex -S mix


#Examples

iex> place 0, 0, :north
iex> move
iex> report
{0, 1, :north}

iex> place 0, 0, :north
iex> left
iex> report
{0, 0, :west}

iex> place 1, 2, :east
iex> move
iex> move
iex> left
iex> move
iex> report
{3, 3, :north}
```

## Run Test
```bash
mix test
```

