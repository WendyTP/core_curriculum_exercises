const person = {
  firstName: 'Rick ',
  lastName: 'Sanchez',
  fullName: this.firstName + this.lastName,
};

console.log(person.fullName);


/*
The above will log: NaN. 'this' is the current context of function when it's invoked. Since line 4 the value is not a function, 
this should not be used, and this is bound to global object. 
As this.firstName (this refers to window at browser envirnoment) is not defined, this operation returns undefined.
undefined + undefined results to NaN  

*/