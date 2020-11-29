# AoC 2019 :: Notes

## Day 01: The Tyranny of the Rocket Equation

- Amount of fuel required
- Amount is based on module's mass
  - floor(mass / 3) - 2
- Sum of fuel requirements
  - sum(floor(m / 3) - 2)


## Day 02: 1202 Program Alarm

### Part 1

- Intcode is a list of integers (like `[1, 0, 0, 3, 99]`)
  - intcode[0] is an opcode of 1, 2, or 99
    - 1 == add value from position `intcode[1]` & values from position `intcode[2]` and store at position `intcode[3]`
    - 2 == like `1` but multiply
    - 99 == program finished
    - unknown == error
  - after processing, move forward 4 spots to the next opcode

### Part 2

- Terminology:
  - **Memory**: initial state; list of integers
  - **Address**: a position in memory; the first integer in memory is at address 0
  - **Instruction**: the opcode (1st integer) in a subset of memory
    - In part 1 these were `1`, `2`, and `99`
  - **Parameters**: the remaining integers in a subset of memory
    - For `1, 2, 3, 4`, `1` is the instruction while `2`, `3`, and `4` are the parameters
  - **Instruction pointer**: address of current instruction
  - **Noun**: value at address `1`
  - **Verb**: value at address `2`
- Find noun & verb required to get an output of `19_690_720`
  - The answer to part 2 is `100 * noun + verb`

<details>
  <summary>SPOILER: Answer to part 2</summary>

  - Noun: 76
  - Verb: 21

  Done by guess and check; realized that the verb increased the output negligibly and noun increased it significantly.

  Order of values guess/checked:

  Noun|Verb|Output|Notes
  ---|---|---|---
  12|2|3_306_701|Values from part 1
  24|2|6_378_701|Multiply noun by 2 seems to multiply output by just under 2
  24|10|6_378_709|Increasing verb by 10 only increases output by 8
  90|2|23_274_701|Intentional big value, exceeds target
  45|2|11_754_701|Lower than target
  75|2|19_434_701|Slightly over halfway between last 2 guesses; gets close to target
  80|2|20_714_701|Expected to exceed
  77|2|19_946_701|Thought this would get close
  76|2|19_690_701|First 6 digits are correct, now increase verb
  76|19|19_690_718|Increase of 17 because I miscalculated and meant to increase by difference between target and last answer (supposed to increas by 19)
  76|20|19_690_719|Still didn't realize my previous miscalculation so increased by 1
  77|21|19_690_720|Target hit!

  Other notes:
  - If we don't change the verb, the last 3 digits never change
  - Incrementing the verb by 1 did indeed increment the result by 1
</details>
