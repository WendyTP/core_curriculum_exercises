function swapName(fullName) {
  let names = fullName.split(' ');
  let lastName = names.slice(-1);
  let firstNames = names.slice(0, names.length - 1);
  return firstNames.join(' ') + ', ' + lastName[0];
}

console.log(swapName('Joe Marie Roberts'));