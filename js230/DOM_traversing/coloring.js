/*
request: 
  - find children of given generation
    - find children of given parent element
    - find matching generation 
      - iterate from generation 1 (document.body) to target generation:
        - get all parents of target generation
        - iterate through parents, get children of each parent
        stop when generation matched


  - add class to the children
    - if children exisit, then add class
*/

function colorGeneration(targetGeneration) {
  let parents = [document.body];
  let generation = 0;
  let children;

  while(generation < targetGeneration) {
    generation += 1;
    children = getAllChildrenOf(parents);
    parents = children;
  }

  if (children) {
    addColorClass(children);
  }
  
  return children;
}

function getAllChildrenOf(parents) {
  let allChildren = [];

  parents.forEach((parent) => {
    let children = Array.prototype.slice.call(parent.children);
    allChildren = allChildren.concat(children);
  });

  return allChildren;
}

function addColorClass(children) {
  children.forEach(child => {
    child.classList.add('generation-color');
  })
}