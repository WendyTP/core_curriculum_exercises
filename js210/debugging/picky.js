/*
museum.includes('Computer')|| museum.includes('Science') || !(
  museum.includes('Modern') && museum.includes('Art') && museum.includes('Andy Warhol') || city === 'Amsterdam'
      );


      f || f || t  ===> t
      f && f && f => f
      f || f => f
*/

function wantToVisit(museum, city) {
  return museum.includes('Computer')
      || museum.includes('Science')
      ||(
        museum.includes('Modern')
        && museum.includes('Art')
        && (museum.includes('Andy Warhol')
        || city === 'Amsterdam')
      );
}

// Tests (should all print 'true')

console.log(wantToVisit('Computer Games Museum', 'Berlin') === true);
console.log(wantToVisit('National Museum of Nature and Science', 'Tokyo') === true);
console.log(wantToVisit('Museum of Modern Art', 'New York') === false);
console.log(wantToVisit('El Paso Museum of Archaeology', 'El Paso') === false);
console.log(wantToVisit('NEMO Science Museum', 'Amsterdam') === true);   // log false
console.log(wantToVisit('National Museum of Modern Art', 'Paris') === false);
console.log(wantToVisit('Andy Warhol Museum of Modern Art', 'Medzilaborce') === true); // log false
console.log(wantToVisit('Moco: Modern Contemporary Art', 'Amsterdam') === true);  // log false
console.log(wantToVisit('Van Gogh Museum', 'Amsterdam') === false);
console.log(wantToVisit('Andy Warhol Museum', 'Melbourne') === false);

