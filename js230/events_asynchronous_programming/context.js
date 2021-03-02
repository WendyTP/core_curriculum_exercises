document.addEventListener('DOMContentLoaded', () => {
  let mainArea = document.querySelector('main');
  mainArea.addEventListener('contextmenu', event => {
    event.preventDefault();
    //event.stopPropagation();
    alert('main');
  });
});