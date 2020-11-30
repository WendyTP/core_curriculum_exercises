function newStack() {
  let stack = [];

  return {
    push(item) {
      stack.push(item);
    },

    pop() {
      stack.pop(item);
    },

    printStack() {
      stack.forEach(i => {
        console.log(i);
      });
    },
  }
}

