/*
request:Implement a function, sliceTree, that is "similar" to the Array.prototype.slice method,  but for DOM tree
  - first arg: start index which is the parent node's id attribute 
  - 2nd arg: end index which is the child node's id attribute.
  - return: an array of tagNames
  - Only consider element nodes & Only elements that have body as an ancestor
  - If the id attribute of the start or end index is not in the DOM, return undefined.
  - If the slice is not feasible — there's no path connecting the element at the starting index 
    to the ending index — return undefined.


*/
