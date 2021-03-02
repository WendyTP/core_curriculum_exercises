/* original code
document.querySelector('html').addEventListener('click', () => {
  document.querySelector('#container').style = 'display: none';
});

document.querySelector('#container').addEventListener('click', event => {
  event.stopPropagation();
});
*/

// refactor: remove event.stoprPropagation but keeps the same behaivour of the codes
document.querySelector('html').addEventListener('click', (event) => {
  let containerElement = document.querySelector('#container');
  let containerDescendents = Array.prototype.slice.call(containerElement.childNodes);
  if (event.target !== containerElement && 
      !containerDescendents.includes(event.target)) {
    containerElement.style = 'display: none';
  } 
});







