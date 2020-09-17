function cleanUp(text) {
  return text.replace(/\W+/g, ' ');
}

console.log(cleanUp("---what's my +*& line7?"))