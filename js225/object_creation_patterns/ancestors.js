/*
Implement an ancestors method that returns the prototype chain (ancestors) 
of a calling object as an array of object names. 
Algo:
  - add a method to Object.prototye:
  - create emty array (result)
  - if Object.getPropertyOf(this) === 'Object.prototype'
    - array.push('Object.prototype')
  - else:
    - while Object.getPropertyOf(this) !== 'Object.prototype'
      - let obj_ancestor = this.__proto__
      - result.push(obj_ancestor.name)
      - this = obj_ancestor
    - result.push('Object.prototype')
  - return result array
*/

/* first try
Object.prototype.ancestors = function() {
  let result = [];
  let current_obj = this;
  while (Object.getPrototypeOf(current_obj) !== Object.prototype) {
    //console.log(current_obj)
    let obj_ancestor = Object.getPrototypeOf(current_obj);
    result.push(obj_ancestor.name);
    current_obj = obj_ancestor;
    //console.log(result)  
  }

  result.push('Object.prototype');
  return result;
}
*/

// given answer
Object.prototype.ancestors = function ancestors() {
  let ancestor = Object.getPrototypeOf(this);

  if (Object.prototype.hasOwnProperty.call(ancestor, 'name')) {
    return [ancestor.name].concat(ancestor.ancestors());
  }

  return ['Object.prototype'];
};


// name property added to make objects easier to identify
const foo = {name: 'foo'};
const bar = Object.create(foo);
bar.name = 'bar';
const baz = Object.create(bar);
baz.name = 'baz';
const qux = Object.create(baz);
qux.name = 'qux';


console.log(qux.ancestors());  // returns ['baz', 'bar', 'foo', 'Object.prototype']
console.log(baz.ancestors());  // returns ['bar', 'foo', 'Object.prototype']
console.log(bar.ancestors());  // returns ['foo', 'Object.prototype']
console.log(foo.ancestors());  // returns ['Object.prototype']