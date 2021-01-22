/*
Requirement: build a simple inventory management system
  item creator: makes sure that all necessary information are present and valid. 
  item manager: creating items, updating information about items, deleting items, and querying information about the items.
  reports manager: generates reports for a specific item or ALL items.
An item has:
  - SKU code :  unique identifier for a product  -- consists of first 3 letters of item name and first 2 letters of the category name (all caps)
  - item name:  must be minimum 5 chars. Space is accepted but not counted as characters
  - category : category that the item belongs to -  must be minimum 5 chars and only one word
  - quantity : quantity in stock - can not be blank (assume a valid number will be provided)

Item creator behaviour:
  - validate required information - if not valid, returns an object with notValid property with value of true

Item manager behaviour (methods) + any customs:
  - create (method) - creates a new item; Return false if creation not successful
  - update (method) - 2 plus arguments: SKU code and any updates - assume all valid inputs
  - delete (method)- 1x argument : SKU code -- assume valid input
  - items (property) -  returns all the items (in a list)  
  - instock (method)- return all items that have quantity > 0 (in a list)
  - itemInCategory (method)- 1 x argument: category; return all items in the given category (in a list)

Report manager behaviour (methods) :
  - init - 1x arg : ItemManager object - assigns it to the `items` property {items: ItemManager}
  - createReporter - 1 x arg : SKU code - returns an object : {itemInfo() -- logs all properties and their values of the SKU code object}
  - reportInStock - logs all item names (of items in stock), separated by comma
*/

const ItemManager = (function(){
  function validItemName(name) {
    return /^[a-zA-Z\s]+$/.test(name) && /[a-zA-Z]{5,}/.test(name);
  }

  function validCategory(category) {
    return /^[a-zA-Z]{5,}$/.test(category);
  }

  function createSkuCode(name, category) {
    let selectedNameLetters = name.replace(/\s/g, '').slice(0,3);
    let selectedCatLetters = category.slice(0,2);
    return selectedNameLetters.concat(selectedCatLetters).toUpperCase();
  }


  return {
    items: [],

    findItem(skuCode) {
      return this.items.find(item => item.skuCode === skuCode);
    },

    create(itemName, cat, qty) {
      if (validItemName(itemName) && validCategory(cat) && qty !== undefined) {
        let itemSkuCode = createSkuCode(itemName, cat);

        this.items.push({
          skuCode: itemSkuCode,
          itemName: itemName,
          category: cat,
          quantity: qty,
        });
      } else {
        return {notValid: true};
      }
    },

    update(sku, updates) {
      let selectedItem = this.findItem(sku)
      Object.keys(updates).forEach(key => {
        selectedItem[key] = updates[key];
      })

      return selectedItem;
    },

    delete(sku) {
      let selectedItem = this.findItem(sku);
      let itemIdx = this.items.indexOf(selectedItem);
      return this.items.splice(itemIdx,1);

    },

    inStock() {
      return this.items.filter(item => item.quantity > 0);
    },

    itemsInCategory(category) {
      return this.items.filter(item => item.category === category);
    },
  }
})();

const ReportManager = (function() {
  return {

    init(obj) {
      this.items = obj;
    },

    reportInStock() {
      return this.items.inStock().map(item => {
        return item.itemName;
      }).join(",");
    },

    createReporter(skuCode) {
      let selectedItem = this.items.findItem(skuCode);
      return {
        itemInfo() {
          Object.getOwnPropertyNames(selectedItem).forEach(propName => {
            console.log(`${propName}: ${selectedItem[propName]}`);
          })
        },
      };
    },
  };
})();


ItemManager.create('basket ball', 'sports', 0);           // valid item
//console.log(ItemManager.create('asd', 'sports', 0));      // { notValid: true }
ItemManager.create('soccer ball', 'sports', 5);           // valid item
//console.log(ItemManager.create('football', 'sports'));
ItemManager.create('football', 'sports', 3);              // valid item
//console.log(ItemManager.create('kitchen pot', 'cooking items', 0));
ItemManager.create('kitchen pot', 'cooking', 3);          // valid item
  
//console.log(ItemManager.items);    // returns list with the 4 valid items

ReportManager.init(ItemManager);
//console.log(ReportManager.reportInStock());
// logs soccer ball,football,kitchen pot

console.log(ItemManager.update('SOCSP', { quantity: 0 }));
// console.log(ItemManager.inStock()); 
// returns list with the item objects for football and kitchen pot

//console.log(ReportManager.reportInStock()); // logs football,kitchen pot

//console.log(ItemManager.itemsInCategory('sports')); 
// returns list with the item objects for basket ball, soccer ball, and football

console.log(ItemManager.delete('SOCSP'));
//console.log(ItemManager.items);
// returns list with the remaining 3 valid items (soccer ball is removed from the list)

const kitchenPotReporter = ReportManager.createReporter('KITCO');
//kitchenPotReporter.itemInfo();
// logs
// skuCode: KITCO
// itemName: kitchen pot
// category: cooking
// quantity: 3

ItemManager.update('KITCO', { quantity: 10 });
kitchenPotReporter.itemInfo();
// logs
// skuCode: KITCO
// itemName: kitchen pot
// category: cooking
// quantity: 10


