/*
request:  a function named delegateEvent that delegates events to a parentElement from the descendant (inner) elements of a parent element that match a given selector.
- the function takes 4 args:  parentElement, selector, eventType, and callback
- function return value:  true if it was able to add an event listener and undefined if it wasn't.
- Assume that all event handlers listen during the bubbling phase.
algo:
  - check if paraentElement exist (return undefined) (document.querySelector)
  - check if selector is decendant of parentElement (child or grandchild)
    - add event listener to parentElement:
      - if (selector is decendant) and event.target is selector, then invoke the callback function
      - otherwise, don't invoke the callback function
  - Q: how to check if an elemeent is a decedant?
    - if a selector is direct children or grandchildren (all ancestors)
      - find all ancestors from body to selector's parent
        - result array
        - while selector !== body {add selector's parent to result; selector = parent}
        - check if parentElement is included in the result array
*/

function findAncestors(element) {
  let ancestors = [];
  let body = document.querySelector('body');
  let child = element;

  while (child !== body) {
    ancestors.push(child.parentElement);
    child = child.parentElement;
  }

  return ancestors;
}

function delegateEvent(parentElement, selector, eventType, callback) {
  let selectorElement = document.querySelector(selector);

  if ( !parentElement || !selectorElement) {
    console.log('not defined')
    return undefined;
  } else {

      return !parentElement.addEventListener(eventType, event => {
        let allSelectorAncestors = findAncestors(selectorElement);
        let validTargets = Array.prototype.slice.call(document.querySelectorAll(selector));

        if (allSelectorAncestors.includes(parentElement) && validTargets.includes(event.target)) {
          callback(event);
        }
      })
  }
}




// Possible elements for use with given scenarios
/*
const element1 = document.querySelector('table');  // not exist
const element2 = document.querySelector('main h1');
const element3 = document.querySelector('main');
*/

// Possible callback for use with the scenarios
const callback = ({target, currentTarget}) => {
  alert(`Target: ${target.tagName}\nCurrent Target: ${currentTarget.tagName}`);
};


/*
document.addEventListener('DOMContentLoaded', () => {
  let navP = document.querySelector('nav p');
  navP.addEventListener('click', callback);
})


// scenario 1: parentElement not exisit
// delegateEvent(element1, 'p', 'click', callback); // undefined 

// scenario 2: selector is not decedent of element2 (h1), but sibling
//delegateEvent(element2, 'p', 'click', callback);  // true; add click event to element2
//(no callback triggered)
//(at click event to h1. The click event is designed to only be triggered if a child 'p'
// can be found within h1.)

// scenario 3: selector is parentElement itself, and not it's child
// delegateEvent(element2, 'h1', 'click', callback); // true;  add click event to element2
// (no callback triggered)
//(the click event is triggered only if a child 'h1' is found and only if event.target is the child)

// scenario 4: selector is grandchildren of parentElement
// delegateEvent(element3, 'h1', 'click', callback);  // true; add click event to element3
//(callback is triggered when click the h1 element )

// scenario 5: selector is grandchildren of parentElemet
// delegateEvent(element3, 'aside p', 'click', callback); // true; add click event to element3
  // (callback is triggered when clicking on ps of aside element)

// scenario 6: added extra p to be the child of element2(main h1).
// delegateEvent(element2, 'p', 'click', callback);  // true; add click event to element2
// (callback is triggered when clicking p element)
*/