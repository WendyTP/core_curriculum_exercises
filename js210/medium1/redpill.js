
function one() {
  function log(result) {
    console.log(result);
  }

  function anotherOne(...args) {
    let result = '';
    for (let i = 0; i < args.length; i += 1) {
      result += String.fromCharCode(args[i]);
    }

    log(result);    // log is called => output result
  }

  function anotherAnotherOne() {
    console.log(String.fromCharCode(87, 101, 108, 99, 111, 109, 101));
    anotherOne(116, 111);  // anotherOne is called
  }

  anotherAnotherOne();   // output 'Welcome' ; then 'to'
  anotherOne(116, 104, 101); // output 'the'
  return anotherOne;  // return the function
}

one()(77, 97, 116, 114, 105, 120, 33); 
// logs:
// 'Welcome', 'to', 'the', 'Matrix!'