/*
22:15 - 22: 39 (24 min)
input: string contains digits and/or (' ' ,'-', '.', '(' ')' )
output: return stirng of 10 digits (good number) ; 10 '0' (bad number)
rules:
  total digits < 10 ==> bad
  total digits === 10 ==> good
  tootal digits === 11 && first digit === 1 ==> good  (remove 1st digit, return last 10 digits)
  total digits === 11 && first digit !== 1 ==> bad
  total digits > 11 ==> bad
data:
  string
algo:
  - remove all non-digits  (replace with'')
  - if digits count is <10 or > 11:
    return '0' x 10
    if digits count is 10:
    return digits 
  - if digits count is 11:
      if first digit is not 1: return 10 0s
      else: return digits sliced from 1dx to last
*/

function cleanPhoneNumber(phoneNumber) {
  let allDigits = phoneNumber.replace(/[^0-9]/g, '');

  if (allDigits.length < 10 || allDigits.length > 11) {
    return '0'.repeat(10);
  } else if (allDigits.length === 10) {
    return allDigits;
  }

  if (allDigits[0] !== '1') {
    return '0'.repeat(10);
  } else {
    return allDigits.slice(1);
  }
}


// only digits
console.log(cleanPhoneNumber('45 566 5654'));   // '000 000 0000' // 9 digits
console.log(cleanPhoneNumber('145 566 5654'));  // '045 566 5654' // 10 digits
console.log(cleanPhoneNumber('1045 566 5654'));  // '045 566 5654' // 11digits
console.log(cleanPhoneNumber('2045 566 5654'));  // '000 000 0000' // 11 digits
console.log(cleanPhoneNumber('2045 5664 5654')); // '000 000 0000' // 12 digits

// contain special chars
console.log(cleanPhoneNumber('045-566.5654'));  // '045 566 5654'
console.log(cleanPhoneNumber('(1) 045-566-5654')); // '045 566 5654'