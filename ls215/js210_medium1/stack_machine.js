/*
15:14 - 15:59
input: valid string input
output: integer or no output (if result is not PRINT out)
rules:
- stack of values ex. [x, y, z], that are either push in or pop out
- register value (current value)
- operation: 1 value from stack (stack.pop()) ; register value ==> operation  ==> remove value from stack(pop) ==> register value === operation result
  ex. register = 7; stack = [3,6,4]; operation Mult ==> register = (7 * 4); stack = [3,6]
- DIV & MOd ==> register / (%) stack value 
data: 
  stack: array
  register: integer

  input: an array of keywords
algo:
  - split input into words
  - itrate through each word:
    - if Number.isInteger(parseInt(word)) 
      - then register =  parseInt(word)
     if word is push, then...
  
*/

function minilang(programs) {
  let stack = [];
  let register = 0;
  let keywords = programs.split(' ');

  keywords.forEach(word => {
    switch(word) {
      case 'PUSH':
        stack.push(register);
        break;
      case 'POP':
        register = stack.pop();
        break;
      case 'PRINT': 
        console.log(register);
        break;
      case 'ADD':
        register = register + stack.pop();
        break;
      case 'SUB':
        register = register - stack.pop();
        break;
      case 'MULT':
        register = register * stack.pop();
        break;
      case 'DIV':
        register = Math.floor(register / stack.pop());
        break;
      case 'MOD':
        register = register % stack.pop();
        break;
      default:
        register = parseInt(word, 10);
    }
  })
}



minilang('PRINT');
// 0

minilang('5 PUSH 3 MULT PRINT');
// 15   ; reg = 5 => stack = [5] => reg = 3 => stack = [] & register = (5 * 3) => 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT');
// 5
// 3
// 8

minilang('5 PUSH POP PRINT');
// 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT');
// 5
// 10
// 4
// 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT');
// 6      ; reg = 3 ==> stack =[3] ==> stack = [3,3] ==> reg = 7 ==> 7 / 3 = 2; reg = 2; stack = [3] ==> reg = 3 * 2; stack [] => 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT');
// 12

minilang('-3 PUSH 5 SUB PRINT');
// 8

minilang('6 PUSH');
// (nothing is printed because the `program` argument has no `PRINT` commands)
