/*
1. serialize data to be form-urlencoded
2. Concatenate the 4 credit card inputs into a single value before adding it to the request body string
3. render the serialized data as text in a block element
*/


class FormValidation {
  constructor() {
    this.elements = {
      form: document.querySelector('form'),
      formError: document.querySelector('p'),
      submitBtn: document.querySelector('input[type="submit"]'),
      renderedP: document.querySelector('p#rendered-form-data'),
    }

    this.invaludInputErrorMessages = {
      'email': 'Please enter a valid email',
      'password': 'Password must be at least 10 characters long',
      'phone': 'Please enter a valid phone number',
      'credit-card': 'Please enter a valid credit card',
    }


    this.addEventListeners();
  }

  addEventListeners() {
    let cardInputs = Array.prototype.slice.call(document.querySelectorAll('input[name="credit-card"]'));
    let firstThreeCardInputs =  cardInputs.slice(0,cardInputs.length -1);
    firstThreeCardInputs.forEach(cardInput => {
      cardInput.addEventListener('keyup', this.changeFocuseToNextInput.bind(this));
    });

    this.elements['form'].addEventListener('submit', this.validateForm.bind(this));
    this.elements['form'].addEventListener('focusin', this.changeInputBorderAndRemoveErrorMsg.bind(this));
    this.elements['form'].addEventListener('focusout', this.validateInput.bind(this));
    this.elements['form'].addEventListener('keypress', this.preventWrongCharsInput.bind(this));

  }

  changeFocuseToNextInput(event) {
    let currentInput = event.target;
    let nextInput = currentInput.nextElementSibling.nextElementSibling;
    if (event.key === 'Shift' || event.key === 'Tab') return;
    if (currentInput.value.length === 4) {  
      nextInput.focus();
    }
  }
  
  validateForm(event) {
    event.preventDefault();
    let allInputs =document.querySelectorAll('dl input');
    let correctInputs = true;

    for (let idx = 0; idx < allInputs.length; idx += 1) {
      let input = allInputs[idx];
      if (!this.verifyIndividualInput(input)) {
        correctInputs = false;
      }
    };

    if (correctInputs) {
      this.elements['formError'].textContent = 'Form successfully submitted';
      let encodedData = this.serializeFormData(this.elements['form']);
      this.elements["renderedP"].textContent = encodedData;

    } else {
      this.elements['formError'].textContent = "Form cannot be submitted until errors are corrected.";
    }
  }

  changeInputBorderAndRemoveErrorMsg(event) {
    if (event.target.tagName === 'INPUT' && event.target !== this.elements['submitBtn']) {
      let input = event.target;
      let span = input.parentElement.querySelector('.error-message');
      this.changeBorderColor(input, 'green');
      span.textContent = '';
    }
  }

  changeBorderColor(input, color) {
    input.style.borderColor = color;
  }

  validateInput(event) {
    if (event.target.tagName === 'INPUT' && event.target !== this.elements['submitBtn']) {
      let input = event.target;
      this.verifyIndividualInput(input);
    }
  }

  verifyIndividualInput(input) {
    
    let span = input.parentElement.querySelector('.error-message');
    let emptyValue = input.value.length === 0;
    let validInput = false;

    if (emptyValue && this.InvalidEmptyInput(input)) {
      return validInput;
    } else if (!emptyValue && this.incorrectInput(input)){
      this.changeBorderColor(input, 'red');
      span.textContent = this.invaludInputErrorMessages[input.name];
      return validInput;
    } else {
      
      this.changeBorderColor(input, 'gray');
      validInput = true;
      return validInput;
    }
  }

  InvalidEmptyInput(input) {
    if (input.name !== 'phone' && input.name !== "credit-card") {
        let span = input.nextElementSibling;
        let inputName = document.querySelector(`label[for=${input.name}]`).textContent;
        this.changeBorderColor(input, 'red');
        span.textContent = `${inputName} is a required field`;
        return true;
    }
  }

  incorrectInput(input) {
      switch (input.name) {
        case 'email':
          if (input.validity.patternMismatch) {
            return true;
          }
          break;
        case 'password':
          if (input.validity.tooShort) {
            return true;
          }
          break;
        case 'phone':
          if (input.validity.patternMismatch) {
            return true;
          }
          break;
        case "credit-card":
          if(input.value.length !== 4) {
            return true;
          }
          break;
      }

      return false;
  }
    

  preventWrongCharsInput(event) {
    if (event.target.tagName === 'INPUT') {
      let input = event.target;
      let pressedKey = event.key;
   
      if (input.name === "first-name" || input.name === 'last-name') {
        if (!/[a-zA-Z']/.test(pressedKey)) {
            event.preventDefault();
        }

      } else if (input.name === "credit-card") {
        if (!/\d/.test(pressedKey)) {
          event.preventDefault();
        }
      }
    }
  }

  serializeFormData(form) {
    let data = new FormData(form);
    let dataWithConcatedCreditCardInput = this.concatData(data);
    let transformedData = new URLSearchParams(dataWithConcatedCreditCardInput);
    return transformedData.toString();

  }

  concatData(formDataObj) {
    let creditNumber = this.concatCreditCardNumbers(formDataObj);
    let tranformedObj = {};

    for (let pair of formDataObj.entries()) {
      if (!Object.keys(tranformedObj).includes(pair[0])) {
        tranformedObj[pair[0]] = pair[1];
      }
    }

    tranformedObj['credit-card'] = creditNumber;
    return tranformedObj;
    
  }

  concatCreditCardNumbers(formDataObj) {
    let creditNumber = '';
    for(let pair of formDataObj.entries()) {
      if (pair[0] === 'credit-card') {
        creditNumber = creditNumber.concat(pair[1]);
      }
    }
    return creditNumber;
  }
}

document.addEventListener('DOMContentLoaded', () => {
  new FormValidation();
})