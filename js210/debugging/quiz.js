c,
a, b, 
c, 
a, b, e, 
b, c, 
c, 
b, 
b, 
b, 
b, d, f, 
b, c,  


function foo() {
  function bar() {
    console.log('bar again and again');
  }

  console.log(foo);

  bar();
}

console.log(foo());