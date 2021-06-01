/*
Display:
1. currentNum screen:
  - only display digits or dot (ex. 78.45)  -> current number or result

  - if only digit or '.' is pressed, continue concat the digits (ex. 7 8 => 78)
  - if '=' is pressed, display the result num
  - if ops btn is pressed (except NEG), display current result
  - if CE or C is pressed, display 0
  - if NEG is pressed, display '-' + num (ex. -45)
    - if currentNum is 0, then it won't add the '-' sign to 0
  
2. entry screen: 
  - display current recorded digits and ops  (ex. 78 + 3 x 2 )  --> expression
  -only display operations when ops btn are clicked 
  

  - display previous numbers + operations until(exclude) equal btn is clicked
  - when '=' is clicked, clear entry (display nothing)
  - when CE is clicked, clear entry (display nothing)
  - when C is clicked, clear entry (display nothing)

calculate operations:
1. compose expression (when a digit or ops btn is clicked)
  - current number: a record of each entered digits and dot  (initial set to 0)
  - ops : record of current clicked ops btn
  - expression: when an ops btn is pressed, push current number and ops to expression (array)
2. calculate (when an ops btn is clicked )
  - transform string digits to number
  - perform current calculation of expression
  - return result (set as current number)
  - if ops btn === '=', then clear expression
3. controls:
  - NEG : add negative sign to current number 
  - CE: clear expression
  - C: clear expression and reset current number to 0
*/

class ArithmeticOperations {
  // perform calculation
  // Q: encapsulate this.expression and this.result
  constructor() {
    this.expression = null;
    this.result = null;
  }

  setExpression(arrInput) {
   let numberInputs = arrInput.map(item => {
      if (Number(item) || item === '0') {
        return Number(item);
      } else {
        return item;
      }
    });
    this.expression = numberInputs;
  }


  calculate() {
    if (this.expression.length === 2) {
      this.result = this.expression[0];
      return;
    }

    let chosenExpression = this.expression.slice(0, this.expression.length - 1);

    this.result = this.performOperations(chosenExpression);

    if (this.expression[this.expression.length -1] === '=') {
      this.expression = null;
    }
  }

  performOperations(arr) {
    let [firstNum, operator, secondNum] = arr.splice(0,3);
    let result = this.performEachOperation(firstNum, operator, secondNum);
    while(arr.length > 0) {
      firstNum = result;
      [operator, secondNum] = arr.splice(0,2);
      result = this.performEachOperation(firstNum, operator, secondNum);
    }
    return result;
  }

  performEachOperation(firstNum, operator, secondNum) {
    switch(operator) {
      case '+': 
      return firstNum + secondNum;
      break;
      case '-': 
      return firstNum - secondNum;
      break;
      case 'x': 
      return firstNum * secondNum;
      break;
      case '/': 
      return firstNum / secondNum;
      break;
      case '%': 
      return firstNum % secondNum;
      break;
    }
  }
}

class CalculatorApp {
  constructor() {
    this.currentNum = '0';
    this.currentExpression = [];
    this.operations = new ArithmeticOperations();
    this.elements = {
      buttonsDiv:  document.querySelector('div#buttons'),
      controlBtns: document.querySelectorAll('.control'),
      entryP: document.querySelector('.entry'),
      currentNumP: document.querySelector('.currentNum'),
    }

    this.init();
  }

  displayAndPerformActions(event) {
    event.preventDefault();
    let button = event.target
    let buttonText = button.textContent;
    let buttonType = button.getAttribute('class');

    if (buttonType !== 'control') {

      if (buttonType === 'ops' && buttonText !== '.') {
        this.registerCurrentExpression(buttonText);
        this.performCalculation();
        this.updateCurrentExpressionDisplay(buttonText);
        this.currentNum = String(this.operations.result);
        this.updateCurrentNumDisplay();
      } else {
        if (this.currentNum === '0' || this.currentNum === String(this.operations.result)) {
          this.currentNum = buttonText;
        } 
        else {
          this.currentNum = this.currentNum.concat(buttonText);
        }
        this.updateCurrentNumDisplay();
      }
    }
  }

  registerCurrentExpression(opsText) {
    this.currentExpression.push(this.currentNum, opsText);
  }

  updateCurrentExpressionDisplay(buttonText) {
    if (buttonText !== '=') {
      let expression = this.currentExpression.join(' ');
    this.elements['entryP'].textContent = expression;
    } else {
      this.elements['entryP'].textContent = '';
      this.currentExpression = [];
    }
  }

  performCalculation() {
    this.operations.setExpression(this.currentExpression);
    this.operations.calculate();
  }

  updateCurrentNumDisplay() {
    this.elements['currentNumP'].textContent = this.currentNum;
  }

  displayAndPerformControl(event) {
    event.preventDefault();
    let button = event.target;
    let buttonText = button.textContent;
    switch (buttonText) {
      case 'CE':
        this.currentNum = '0';
        this.updateCurrentNumDisplay();
        break;
      case 'C':
        this.currentNum = '0';
        this.updateCurrentNumDisplay();
        this.currentExpression = [];
        this.updateCurrentExpressionDisplay();
        break;
      case 'NEG':
        if (this.currentNum !== '0' && !this.currentNum.includes('-')) {
          this.currentNum = '-' + this.currentNum;
          this.updateCurrentNumDisplay();
        }
        break;
    }
  }


  bind() {
    this.elements['buttonsDiv'].addEventListener('click', this.displayAndPerformActions.bind(this));
    
    this.elements['controlBtns'].forEach(btn => {
      btn.addEventListener('click', this.displayAndPerformControl.bind(this));
    });
  }


  init() {
    this.bind();
  }
}

document.addEventListener('DOMContentLoaded', () => {
  new CalculatorApp();
})



