function createGreeter(name) {
  return {
    name,
    morning: 'Good Morning',
    afternoon: 'Good Afternoon',
    evening: 'Good Evening',
    greet(timeOfDay) {
      let msg = '';
      switch (timeOfDay) {
        case 'morning':
          msg += `${this.morning} ${name}`;
          break;
        case 'afternoon':
          msg += `${this.afternoon} ${this.name}`;
          break;
        case 'evening':
          msg += `${this.evening} ${this.name}`;
          break;
      }

      console.log(msg);
    },
  };
}


const helloVictor = createGreeter('Victor');
helloVictor.greet('morning');  // Good Morning Victor

// To access to object properties, we need to use 'this' keyword
// in this function
// Alternatively, we can omit 'this' when accessing to value of
// name property, this is because we are accessing it via function parameter
