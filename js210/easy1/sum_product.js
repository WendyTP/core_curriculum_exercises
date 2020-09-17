let rlSync = require('readline-sync');

function computeSum(number) {
  let sum = 0;
  for (let num = 1; num <= number; num += 1) {
    sum += num;
  }
  return sum;
}

function computeProduct(number) {
  let product = 1;
  for (let num = 1; num <= number; num += 1) {
    product *= num;
  }
  return product;
}


let integer = rlSync.question('Please enter an integer greater than 0: ');
integer = Number.parseInt(integer, 10);

let operation = rlSync.question('Enter "s" to compute the sum, or "p" to compute the product. ');

if (operation === 's' || operation === 'S') {
  let sum = computeSum(integer);
  console.log(`The sum of the integers between 1 and ${String(integer)} is ${sum}`);
} else if (operation === 'p' || operation === 'P') {
  let product = computeProduct(integer);
  console.log(`The product of the integers between 1 and ${integer} is ${product}`)
} else {
  console.log('Unknown operation.')
}

