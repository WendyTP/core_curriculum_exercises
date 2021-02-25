/*
 request: write a function that takes two element ids as arguments and 
  swaps the positions of the elements represented by the ids.
  return: true for valid swap; undefined for invalid swap
- valid swap: id exist; same hierachy level
- invalid swap: id not exist; parent/child relationship
algo:
  - valid ids?
    -check if two id exist  (document.getElementById(#))
    - check if 1st id is in parents of 2nd id or vice versa
  - swap ids
*/

function nodeSwap(id1, id2) {
  let element1 = document.getElementById(String(id1));
  let element2 = document.getElementById(String(id2));
  if (element1 && element2) {
      if (nonDecendentsRelationship(element1, element2)) {
        let placeholderElement1 = document.createElement('p');
        let placeholderElement2 = document.createElement('p');

        element1.insertAdjacentElement('beforebegin', placeholderElement1);
        element2.insertAdjacentElement('beforebegin', placeholderElement2);

        placeholderElement1.replaceWith(element2);
        placeholderElement2.replaceWith(element1);
        return true;
      }

    
  }
}

function nonDecendentsRelationship(element1, element2) {
  let element1Decendents = findElementDecendents(element1);
  let element2Decendents = findElementDecendents(element2);
  return !element1Decendents.includes(element2) &&
         !element2Decendents.includes(element1)
}


function findElementDecendents(element) {
  let decedents = [];
  walk(element, function(ele) {
    decedents.push(ele);
  });
  return decedents;
}

function walk(element, callback) {
  callback(element);
  for (let idx = 0; idx < element.children.length; idx += 1) {
    walk(element.children[idx], callback);
  }
}




