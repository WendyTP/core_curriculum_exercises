function triangle(numOfStar) {
  let starCount = 1;
  let spaceCount = numOfStar - starCount;
  
  while (starCount <= numOfStar) {
    console.log(`${' '.repeat(spaceCount)}${'*'.repeat(starCount)}`);
    starCount += 1;
    spaceCount -= 1;
  }
}

triangle(5);
triangle(9);