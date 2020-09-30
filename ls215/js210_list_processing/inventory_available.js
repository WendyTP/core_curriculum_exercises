/*
Question:
  - a function takes two arguments: an inventory item and a list of transactions.
    The function should return true only if the sum of the quantity values of the item's transactions is greater than zero.
    (. A movement value of 'out' will decrease the item's quantity.)
Algo:
  - select all transaction of the given item
  - calculate the  qty ( add ins and minus outs)
  - return true if the calculation result is greater than 0
*/


function isItemAvailable(inventoryItem, transactions) {
  let selectedTransactions = transactionsFor(inventoryItem,transactions);
  let remainingItemQuantity = calculateQuantity(selectedTransactions);

  return remainingItemQuantity > 0;
  
}

function calculateQuantity(transactions) {
  return transactions.reduce((sum, transaction) => {
    if (transaction.movement === 'in') {
      return sum + transaction.quantity;
    } else {
      return sum - transaction.quantity;
    }
  },0)
}

function transactionsFor(inventoryItem, transactions) {
  return transactions.filter(itemDetails => {
    return itemDetails.id === inventoryItem;
  })
}


const transactions = [ { id: 101, movement: 'in',  quantity:  5 },
                       { id: 105, movement: 'in',  quantity: 10 },
                       { id: 102, movement: 'out', quantity: 17 },
                       { id: 101, movement: 'in',  quantity: 12 },
                       { id: 103, movement: 'out', quantity: 15 },
                       { id: 102, movement: 'out', quantity: 15 },
                       { id: 105, movement: 'in',  quantity: 25 },
                       { id: 101, movement: 'out', quantity: 18 },
                       { id: 102, movement: 'in',  quantity: 22 },
                       { id: 103, movement: 'out', quantity: 15 },];


console.log(isItemAvailable(101, transactions));
console.log(isItemAvailable(105, transactions));