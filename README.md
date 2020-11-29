# AoC 2019 :: Notes

## Day 01: The Tyranny of the Rocket Equation

- Amount of fuel required
- Amount is based on module's mass
  => floor(mass / 3) - 2
- Sum of fuel requirements
  => sum(floor(m / 3) - 2)


## Day 02: 1202 Program Alarm

- Intcode is a list of integers (like `[1, 0, 0, 3, 99]`)
  => intcode[0] is an opcode of 1, 2, or 99
    + 1 == add value from position `intcode[1]` & values from position `intcode[2]` and store at position `intcode[3]`
    + 2 == like `1` but multiply
    + 99 == program finished
    + unknown == error
  => after processing, move forward 4 spots to the next opcode
