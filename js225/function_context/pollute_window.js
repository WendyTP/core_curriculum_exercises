/* original code
const name = 'Naveed';
const greeting = 'Hello';

const greeter = {
  message: `${greeting} ${name}!`,
  sayGreetings() {
    console.log(this.message);
  }
};

greeter.sayGreetings()  // Hello Naveed!
*/

// refactor by removing global variables
/*
function greeter() {
  let name = 'Naveed';
  let greeting = 'Hello';

  let message = `${greeting} ${name}!`;

  console.log(message);
}

greeter() // Hello Naveed!
*/

// refactor by using IIFE (Immediate Invoked Function Expression)

const greeter = {
  message: (() => {
    let name = 'Naveed';
    let greeting = 'Hello';

    return `${greeting} ${name}!`
  })(),
  sayGreetings() {
    console.log(this.message);
  }
};

greeter.sayGreetings()  // Hello Naveed!