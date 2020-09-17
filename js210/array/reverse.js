/*
a reverse method works for both string and array
retruns a new string or array
not mutating original argument

*/

function reverse(inputForReversal) {
  let reversed;
  if (Array.isArray(inputForReversal)) {
    reversed = [];
    for (let idx = 0; idx < inputForReversal.length; idx += 1) {
      reversed.unshift(inputForReversal[idx]);
    }
  }

  if (typeof inputForReversal === 'string') {
    reversed = '';
    for (let idx = inputForReversal.length - 1; idx >= 0; idx -= 1) {
      reversed += inputForReversal[idx];
    }
  }
  return reversed;
}

console.log(reverse('Hello'));
console.log(reverse('a'));
console.log(reverse([1, 2, 3, 4]));
console.log(reverse([]));

const array = [1, 2, 3];
console.log(reverse(array));
console.log(array);
