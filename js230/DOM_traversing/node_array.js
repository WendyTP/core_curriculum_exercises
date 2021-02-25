/*
a function that converts the DOM (from 'body') to nested arrays.
Each element in the DOM is represented as ["PARENT_TAG_NAME", [children]],
where children are elements as well and as such follow the same format. 
ex. ["PARENT_TAG_NAME", []] or ["BODY", [["DIV", []]]]
data: nested array
algo:
  -Check if the parent element has children.
  - if yes, set the value of children array to : [parentElement, [children]]
  - if not, set to : [parentElement, []]
  - Check if any of the children are parents
  - If there are parents, repeat the process from step 1

*/

function nodeToArr(baseNode) {
  let result = [baseNode.tagName, []];
  let children = baseNode.children;

  for (let idx = 0; idx < children.length; idx += 1) {
    let child = children[idx];
    result[1].push(nodeToArr(child));
  }

  return result;
}