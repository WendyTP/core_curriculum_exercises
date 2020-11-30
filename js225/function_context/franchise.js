/* original codes
const franchise = {
  name: 'How to Train Your Dragon',
  allMovies() {
    return [1, 2, 3].map(function(number) {
      return `${this.name} ${number}`;
    });
  },
};

console.log(franchise.allMovies())

The above logs ['undefined 1', 'undefined 2', 'undefined 3']
this is bound to global object when the anonymous function passed to map is invoked.
*/

/* first attempt
const franchise = {
  allMovies() {
    let name = 'How to Train Your Dragon';
    return [1, 2, 3].map(function(number) {
      return `${name} ${number}`;
    });
  },
};
*/

/* second attempt
const franchise = {
  name: 'How to Train Your Dragon',
  allMovies() {
    let self = this;
    return [1, 2, 3].map(function(number) {
      return `${self.name} ${number}`;
    });
  },
};
*/
/* 3rd attempt
const franchise = {
  name: 'How to Train Your Dragon',
  allMovies() {
    return [1, 2, 3].map(function(number) {
      return `${this.name} ${number}`;
    }.bind(this));
  },
};
*/
const franchise = {
  name: 'How to Train Your Dragon',
  allMovies() {
    return [1, 2, 3].map(function(number) {
      return `${this.name} ${number}`;
    }, this);
  },
};


console.log(franchise.allMovies()); //  ['How to Train Your Dragon 1', 'How to Train Your Dragon 2', 'How to Train Your Dragon 3']