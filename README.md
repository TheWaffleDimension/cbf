# sturdy-goggles
A really crappy stack-based esoteric programming language. Don't expect too much out of this.

## Implementation
This implementation is in Lua. Shouldn't be hard to recreate in other languages.

Stack in this implementation is locked from 0 - 1,000,000.

### Operators:
| Operator | Description |
| -------- | ----------- |
| ( / )    | While loop.  |
| [ / ]    | Conditional. (If statement) |
| +        | Increment the number at the stack pointer. |
| -        | Decrement the number at the stack pointer. |
| #        | Returns the number at the current stack pointer. (Only used in conditionals)
| \|       | Print the number at the current stack pointer. |
| \"       | Print the number at the current stack pointer in ASCII. |
| :        | Equals. (Only used in conditionals) |
| ;        | Break loop/terminate the program if not in a loop. |
| >        | Increment the stack pointer. |
| <        | Decrement the stack pointer. |
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
RIP stag