function processOrder(price, quantity, discount, serviceCharge, tax) {
  quantity = quantity || 1;
  discount = discount || 0;
  serviceCharge = serviceCharge || 0.1;
  tax = tax || 0.15;

  return (price * quantity) * (1 - discount) * (1 + serviceCharge) * (1 + tax);
}

console.log(processOrder(100,[]));
// whne one input is 0, it will be treated as a false value.
// user can not omit only certain inputs -> they must give all inputs or one input (price)
// user can input any truthy values, including string, empty array, which will not be processed correctly