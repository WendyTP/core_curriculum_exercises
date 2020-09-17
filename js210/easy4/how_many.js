function countOccurrences(arr) {
  let countedResult = {};

  arr.forEach((item) => {
    if (Object.keys(countedResult).includes(item)) {
      countedResult[item] += 1;
    } else {
      countedResult[item] = 1;
    }
  })

  Object.keys(countedResult).forEach((key) => {
    console.log(`${key} => ${countedResult[key]}`)
  })
}

const vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck',
                'motorcycle', 'motorcycle', 'car', 'truck'];

countOccurrences(vehicles);