function makeList() {
  let todos = [];
  return {
    list() {
      if (todos.length === 0) {
        console.log('The list is empty.');
      } else {
        todos.forEach(todo => {console.log(todo)});
      }
    },

    add(todo) {
      if (todos.indexOf(todo) === -1) {
        todos.push(todo);
        console.log(`${todo} added!`);
      }
    },

    remove(todo) {
      if (todos.indexOf(todo) !== -1) {
        todos.splice(todos.indexOf(todo), 1);
        console.log(`${todo} removed!`);
      }
    },
  };
}

let list = makeList();
// list();     // The list is empty.
list.add('make breakfast'); //make breakfast added!
list.add('read book');      // read book added!
list.list()
    // make breakfast
    //read book
list.remove('make breakfast');   // make breakfast removed!
list.list();   // read book

