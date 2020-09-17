const array = ['Apples', 'Peaches', 'Grapes'];

array[3.4] = 'Oranges';
console.log(array.length); // 3    array.length does not count invalid indexed item as elements
console.log(Object.keys(array).length); // 4 object.keys count any key-value paires

array[-2] = 'Watermelon';
console.log(array.length); // 3
console.log(Object.keys(array).length); // 5