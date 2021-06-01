/*
request:Implement a function, sliceTree, that is "similar" to the Array.prototype.slice method,  but for DOM tree
  - first arg: start index which is the parent node's id attribute 
  - 2nd arg: end index which is the child node's id attribute.
  - return: an array of tagNames
  - Only consider element nodes & Only elements that have body as an ancestor
  - If the id attribute of the start or end index is not in the DOM, return undefined.
  - If the slice is not feasible — there's no path connecting the element at the starting index 
    to the ending index — return undefined.

algo:
     - check if both ids are valid -> if not, return undefined
      - check relationship (if end id is child or grand child of start id) -> if not, return undefined
        - get all ancestors of end id ele, then check 
      	  - if yes, slice off all ancestors arr to only includes upto start id; then transform the arr with tagnames of elements
      
      - return arr;
*/
function getAllAncestors(ele) {
        let arr = [];
        let currentEle = ele;
        while (currentEle.parentNode.nodeName !== 'BODY') {
          arr.push(currentEle.parentNode);
          currentEle = currentEle.parentNode;
        }
        return arr;
      }

      function getTagNames(elements) {
        return elements.map(ele => {
          return ele.nodeName;
        });
      }

      function sliceTree(ancestorId, descendentId) {
        let ancestor = document.getElementById(ancestorId);
        let descendent = document.getElementById(descendentId);

        if (ancestor && descendent) {
          let allAncestors = getAllAncestors(descendent);

          if (allAncestors.includes(ancestor)) {
            allAncestors = allAncestors.slice(0, allAncestors.indexOf(ancestor));
            allAncestors.push(ancestor);
            allAncestors.reverse();
            allAncestors.push(descendent);
            let result = getTagNames(allAncestors);
            return result;
          } else {
            return undefined;
          }
        } else {
          return undefined;
        }
      }

