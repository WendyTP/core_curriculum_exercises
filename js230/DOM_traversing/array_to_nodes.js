/*
request:
  a function that converts a nested array of nodeNames to nodes

ex. ["BODY", [
//   ["HEADER", []],
//   ["MAIN", []],
//   ["FOOTER", []]]]

ex. ['BODY' []];

*/

let nodes = ['BODY', [ ['DIV', []] ] ];

function arrayToNodes(nodes) {
  let parentNode = document.createElement(nodes[0]);
  let children = nodes[1];

  if (children.length === 0) {
    return parentNode;
  } else {
    for (let idx = 0; idx < children.length; idx += 1) {
      parentNode.appendChild(arrayToNodes(children[idx]));
    }
  }

  return parentNode;
}

