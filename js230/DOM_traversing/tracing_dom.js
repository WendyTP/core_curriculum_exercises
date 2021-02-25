function domTreeTracer(elementId) {
  let result = [];
  let currentElement = document.getElementById(String(elementId));
  while (currentElement.parentElement.nodeName !== 'HTML') {
    console.log(currentElement.parentElement);
    result.push(findElementSiblings(currentElement.parentElement));
    currentElement = currentElement.parentElement;
  }
  return result;

}

function findElementSiblings(elementParent) {
  let result = [];
  let children = elementParent.children;
  for (let idx = 0; idx < children.length; idx += 1) {
    result.push(children[idx].nodeName);
  }
  return result;

}