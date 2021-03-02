/*
requirement:
  Implement a function that tracks events on a web page by wrapping a callback function 
  in a function that adds each event to a tracker object before invoking the callback. 
argument: a callback function
return: a new function that: records the event && executes the callback function
data: an object (tracker) which contains all events added
Assumption:
  - Assume that the user clicks the elements in the following order: div#blue, div#red, div#orange, and div#green.
  - Use the "click" event listeners for the four elements
Algo:
  -create a tracker object
    - list method: return an array of added events
    - element method: return an array of elements which has an event added onto
    - clear methpod: empty the array of added events
*/
const divRed = document.querySelector('#red');
const divBlue = document.querySelector('#blue');
const divOrange = document.querySelector('#orange');
const divGreen = document.querySelector('#green');


let tracker = (function() {
  let events = [];

  return {

    list() {
      return events;
    },

    elements() {
      return events.map(event => {
        return event.target;
      })
    },

    add(event) {
      events.push(event);
    },

    clear() {
      events = [];
      return events;
    },
  };

})();

function track(callback) {
  function isEventTracked(events, event) {
    return events.includes(event);
  }

  return function(event) {
    if (!isEventTracked(tracker.list(), event)) {
      tracker.add(event);
    }
    callback(event);
  };

}

divRed.addEventListener('click', track(event => {
  document.body.style.background = 'red';
}));

divBlue.onclick = track(event => {
  event.stopPropagation();
  document.body.style.background = 'blue';
  
});

divOrange.addEventListener('click', track(event => {
  event.stopPropagation();
  document.body.style.background = 'orange';
}));

divGreen.addEventListener('click', track(event => {
  event.stopPropagation();
  document.body.style.background = 'green';
}));