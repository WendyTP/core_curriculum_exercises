/*
<div id="1">
  <h1 id="2">Hello, <em id="3">World</em></h1>
  <p id="4">
    Welcome to wonderland. This is an
    <span id="5">awesome</span> place.
  </p>
  <a href="#" id="6"><strong id="7">Enter</strong></a>
  <div id="8"><p id="9"><a href="#" id="10">Go back</a></p></div>
</div>


*/


function walk(node, callBack) {
  callBack(node);
  for (let idx= 0; idx < node.childNodes.length; idx += 1) {
      walk(node.childNodes[idx], callBack);
  }
}

function countChildNodes(nodeId) {
  let parent = document.getElementById(String(nodeId));
  let count = 0;
  let directChilds = Array.prototype.slice.call(parent.childNodes);
  walk(parent, function(node) {
      if (!directChilds.includes(node)) {
          count+= 1;
      }
  })
  return [directChilds.length, count - 1]
}

// sample output
childNodes(1);
//[9, 12]
childNodes(4);
//[3, 1]
childNodes(9);
//[1, 1]
