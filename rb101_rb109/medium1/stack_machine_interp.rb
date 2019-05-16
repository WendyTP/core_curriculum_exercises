=begin
A stack is a list of values that grows and shrinks dynamically. 
In ruby, a stack is easily implemented as an Array that just uses the #push and #pop methods.
stack : an array of values 
register : current value (outside of stack)
operation: operation done using register and the topmost value from stack (most recently pushed value). 
  The stack value is popped out from stack.

MULT : pop stack value ; stack value * register value ; register value = result of multipli

input: a string
output: return integer(s)
rules: all operations are integer operations ; register initialed to 0; assume all argument is valid
example: "5 PRINT PUSH 3 PRINT ADD PRINT "
algorithim:
stack = []
register = 0
split action into array, and iterate through each pieces 
=end

def minilang(programme)
  stack =[]
  register = 0
  programme.split.each do |token|
    case token
    when "ADD" then register += stack.pop
    when "SUB" then register -= stack.pop
    when "MULT" then register *= stack.pop
    when "DIV" then register /= stack.pop
    when "MOD" then register %= stack.pop
    when "PUSH" then stack << register
    when "POP" then register = stack.pop
    when "PRINT" then puts register
    else
      register = token.to_i
    end
  end
end

minilang("-3 PUSH 5 SUB PRINT")

