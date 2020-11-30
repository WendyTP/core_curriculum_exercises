
function myBind(func, context) {
  return function() {
    return func.call(context);
  };
}

/*
function myBind(func, ctx) {
  return function(...args) {
    return func.apply(ctx, args);
  };
}
*/
function greet() {
  console.log(this)
  return this.name;
}

let names = {
  name: 'john',
}

console.log(myBind(greet, names)())