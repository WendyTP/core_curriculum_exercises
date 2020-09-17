const species = ['wolf', 'human', 'wasp', 'squirrel', 'weasel', 'dinosaur'];
const isMidnight = true;
const isFullmoon = true;

function isTransformable(species) {
  return species[0] === 'w';
}

function transform(species) {
  return `were${species}`;
}

for (let i = 0; i < species.length; i++) {
  const thisSpecies = species[i];
  let newSpecies;
  console.log(species[i])
  console.log(newSpecies)

  if (isMidnight && isFullmoon && isTransformable(thisSpecies)) {
      newSpecies = transform(thisSpecies);
  }

  if (newSpecies) {
    console.log(`Beware of the ${newSpecies}!`);
  }
}

/*
, var has function scope. However, on the contrary, let variable type from ES6 has block scope, 
so if we changed all occurences of var by let in the original code (line 15), 
the code would work as intented because newSpecies on line 16 would be initialized to undefined every time the for loop is run.

(Since var doesn't have block scope, these variable declarations are hoisted 
to the top of their scope, which is the global scope.)
*/