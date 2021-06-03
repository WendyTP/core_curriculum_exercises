
/*
1. display error when a form field loses focus + color up the filed border to red
2. remove error when a field regain focus + color up the border to green
3. remove error if a field is correctly filled + remove red and green border color
*/
class FormValidation {
  constructor() {
    this.elements = {
      form: document.querySelector('form'),
      formError: document.querySelector('p'),
      submitBtn: document.querySelector('input[type="submit"]'),
    }

    this.invaludInputErrorMessages = {
      'email': 'Please enter a valid email',
      'password': 'Password must be at least 10 characters long',
      'phone': 'Please enter a valid phone number',
    }


    this.addEventListeners();
  }

  addEventListeners() {
    this.elements['form'].addEventListener('submit', this.validateForm.bind(this));
    this.elements['form'].addEventListener('focusin', this.changeInputBorderAndRemoveErrorMsg.bind(this));
    this.elements['form'].addEventListener('focusout', this.validateInput.bind(this));
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
      this.elements['formError'].textContent = 'Form successfully submitted'
    } else {
      this.elements['formError'].textContent = "Form cannot be submitted until errors are corrected.";
    }
  }

  changeInputBorderAndRemoveErrorMsg(event) {
    if (event.target.tagName === 'INPUT' && event.target !== this.elements['submitBtn']) {
      let input = event.target;
      let span = input.nextElementSibling;
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
    let inputName = document.querySelector(`label[for=${input.id}]`).textContent;
    let span = input.nextElementSibling;

    if (this.emptyInput(input)) {
      this.changeBorderColor(input, 'red');
      span.textContent = `${inputName} is a required field`;
      return false;
    } else if (this.incorrectInput(input)){
      this.changeBorderColor(input, 'red');
      span.textContent = this.invaludInputErrorMessages[input.id];
      return false;
    } else {
      this.changeBorderColor(input, 'gray');
      return true;
    }
  }

  emptyInput(input) {
    if (input.id !== 'phone') {
      return input.value.length === 0;
    }
  }

  incorrectInput(input) {
    
    switch (input.id) {
      case 'email':
        if (input.validity.patternMismatch) {
          return true;
        }
      case 'password':
        if (input.validity.tooShort) {
          return true;
        }
      case 'phone':
        if (input.validity.patternMismatch) {
          return true;
        }
    }
    return false;
  }
}

document.addEventListener('DOMContentLoaded', () => {
  new FormValidation();
})