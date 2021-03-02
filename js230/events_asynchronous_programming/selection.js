/*
event#1: click on classifications
event#2: click on animals
event#3: click on clear
- to add event to select (event: 'change')
- to set customised options 
- to reset

data for options: object with 2 key-values
algo:
- set all valid options
- event listener for form:
  - get selected value
  - choose right options basd on event target
    - iterate through the options and hid the selected options

*/
document.addEventListener('DOMContentLoaded', () => {
  
  let validOptions = {
    Classifications: {
      Vertebrate: ['Bear', 'Turtle', 'Whale', 'Salmon', 'Ostrich'],
      'Warm-blooded': ['Bear', 'Whale', 'Ostrich'],
      'Cold-blooded': ['Salmon', 'Turtle'],
      Mammal: ['Bear', 'Whale'],
      Bird: ['Ostrich'],
    },

    Animals: {
      Bear: ['Vertebrate', 'Warm-blooded', 'Mammal'],
      Turtle: ['Vertebrate', 'Cold-blooded'],
      Whale: ['Vertebrate', 'Warm-blooded', 'Mammal'],
      Salmon: ['Vertebrate', 'Cold-blooded'],
      Ostrich: ['Vertebrate', 'Warm-blooded', 'Bird'],
    },
  }

  let form = document.getElementById('selection-filters');
  let classiSelect = document.getElementById('animal-classifications');
  let animalSelect = document.getElementById('animals');
  let clearButton = document.getElementById('clear');

  form.addEventListener('input', event => {
    let chosenTrait = event.target.value;   // ex. Vertebrate
    let traitSelect = event.target;    // select #animal-classification
    let correspondSelect = traitSelect === classiSelect ? animalSelect : classiSelect;  // select #animals
    let correspondOptionType = correspondSelect.options[0].value;   // ex. 'Animal'

    [...correspondSelect.children].slice(1).forEach(option => {
      if (!validOptions[correspondOptionType][option.value].includes(chosenTrait)) {
        option.hidden = true;
      };
    });
  });

  clearButton.addEventListener('click', event => {
    event.preventDefault();
    form.reset();
    [...classiSelect.children].forEach(option => option.hidden = false);
    [...animalSelect.children].forEach(option => option.hidden = false);
  })
  



 
  
 
})