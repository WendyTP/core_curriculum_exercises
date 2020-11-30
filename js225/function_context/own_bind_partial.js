/* first attempt
function myBind(func, ctx, arg1) {
  return function(arg2) {
    return func.call(ctx, arg1, arg2);
  };
}
*/

function myBind(func, ctx, ...partialArgs) {
  return function(...args) {
    let allArgs = partialArgs.concat(args);
    return func.apply(ctx, allArgs);
  }
}

function greet(surname, gender) {
  return this.firstName + ' ' + surname + ' ' + gender;
}

let names = {
  firstName: 'john',
}

console.log(myBind(greet, names, 'Smith')('male'))