// generate 16 character sequence 

let Account = function() {

  function validPassword(inputPassword, userPassword) {
    return inputPassword === userPassword;
  }

  function returnUserValue(inputPassword, userPassword, userValue) {
    if (validPassword(inputPassword, userPassword)) {
      return userValue;
    } else {
      return "Invalid Password";
    }
  }

  function generateRandomCharacter() {
    let randomIdx = Math.floor(Math.random() * ((62) - 0) + 0);
    return 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRTSUVWXYZ1234567890'[randomIdx];
  }

  function generateDisplayName() {
    let result = '';
    for (let i = 0; i < 16; i += 1) {
      result += generateRandomCharacter();
    }
    
    return result;
  }

  return {
      init: function(email, password, firstName, lastName) {
        let userEmail = email;
        let userPassword = password;
        let userFirstName = firstName;
        let userLastName = lastName;
        this.displayName = generateDisplayName();

        this.firstName= function(inputPassword) {
          //return returnUserValue(inputPassword, userPassword, userFirstName);
          if (validPassword(inputPassword, userPassword)) {
            return userFirstName;
          } else {
            return "Invalid Password"
          }
        };

        this. lastName = function(inputPassword) {
         //return returnUserValue(inputPassword, userPassword, userLastName);
         if (validPassword(inputPassword, userPassword)) {
          return userLastName;
        } else {
          return "Invalid Password"
        }
        };

        this.email = function(inputPassword) {
          //return returnUserValue(inputPassword, userPassword, userEmail);
          if (validPassword(inputPassword, userPassword)) {
            return userEmail;
          } else {
            return "Invalid Password"
          }
        };

        this. resetPassword = function(inputPassword,newPassword) {
          if (validPassword(inputPassword, userPassword)) {
            userPassword = newPassword;
            return true;
          } else {
            return "Invalid Password";
          }
        };

        this.reanonymize= function(inputPassword) {
          if (validPassword(inputPassword, userPassword)) {
            this.displayName = generateDisplayName();
          } else {
            return "Invalid Password"
          }
        };
        return this;
      }
    };
}();

const fooBar = Object.create(Account).init('foo@bar.com', '123456', 'foo', 'bar');

console.log(fooBar.firstName);                     // returns the firstName function
//console.log(fooBar.email);                         // returns the email function
console.log(fooBar.firstName('123456'));           // logs 'foo'
//console.log(fooBar.firstName('abc'));              // logs 'Invalid Password'
//console.log(fooBar.lastName('123456'));            // logs 'bar'
console.log(fooBar.displayName);                   // logs 16 character sequence
console.log(fooBar.resetPassword('123', 'abc'))    // logs 'Invalid Password';
console.log(fooBar.resetPassword('123456', 'abc')) // logs true

const displayName = fooBar.displayName;
fooBar.reanonymize('abc');                         // returns true
console.log(displayName === fooBar.displayName);   // logs false

const bazQux = Object.create(Account).init('baz@qux.com', '123456', 'baz', 'qux');
console.log(fooBar.firstName('abc'));              // logs 'baz' but should log foo.
console.log(fooBar.email('abc'));                  // 'baz@qux.com' but should 'foo@bar.com'