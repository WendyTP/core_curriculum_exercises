/*
requirement:
  - When the user clicks on a navigation link (Articles 1-4), 
  the browser scrolls to that article in the <main> element and adds the highlight class to it. 
  If another element already has the highlight class, the browser removes the class from that element.

  - When the user clicks on an article element or any of its child elements, the browser adds the highlight class to it. 
  If another element already has the highlight class, the browser removes the class from that element.

  - hen the user clicks anywhere else on the page, the browser adds the highlight class to the main element. 
  If another element already has the highlight class, the browser removes the class from that element.
algo:
  - 3x events: 
    -click on nav
    - click on article element or its child elements
    - click outside article
  - add highlight to chosen element
  - remove highlight from other elements
  - possible highlights: articles

*/

document.addEventListener('DOMContentLoaded', () => {
  let nav = document.querySelector('ul');
  let articles = Array.from(document.querySelectorAll('article'));
  let main = document.querySelector('main');

  function removeHighlightFromElements() {
    [main].concat(articles).forEach(element => {
      if (Array.from(element.classList).includes('highlight')) {
        element.classList.remove('highlight');
      }
    });
  }

  // click on nav
  Array.from(nav.children).forEach(list => {
    list.addEventListener('click', event => {
    removeHighlightFromElements();
    let linkRef = event.target.getAttribute('href');
    let selectedArticle = articles.filter(article => {return article.id === linkRef.slice(1)})[0];
    selectedArticle.classList.add('highlight');
    event.stopPropagation();
  });

  // click on articles
  articles.forEach(article => {
    article.addEventListener('click', event => {
      removeHighlightFromElements();
      article.classList.add('highlight');
      event.stopPropagation();
    })
  });

  // click on main
  document.addEventListener('click', event => {
    removeHighlightFromElements();
    main.classList.add('highlight');
    event.stopPropagation()
  })
}, true);

})