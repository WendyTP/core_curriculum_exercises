let questions = [
  {
    id: 1,
    description: "Who is the author of <cite>The Hitchhiker's Guide to the Galaxy</cite>?",
    options: ['Dan Simmons', 'Douglas Adams', 'Stephen Fry', 'Robert A. Heinlein'],
  },
  {
    id: 2,
    description: 'Which of the following numbers is the answer to Life, the \
                  Universe and Everything?',
    options: ['66', '13', '111', '42'],
  },
  {
    id: 3,
    description: 'What is Pan Galactic Gargle Blaster?',
    options: ['A drink', 'A machine', 'A creature', 'None of the above'],
  },
  {
    id: 4,
    description: 'Which star system does Ford Prefect belong to?',
    options: ['Aldebaran', 'Algol', 'Betelgeuse', 'Alpha Centauri'],
  },
]

let answrKey = { '1': 'Douglas Adams', '2': '42', '3': 'A drink', '4': 'Betelgeuse' };

class CreateQuizForm {
  constructor() {
    this.templates = {};
    this.registerPartials();
    this.compileTemplates();
    this.init();
  }

  registerPartials() {
    document.querySelectorAll('[data-type="partial"]').forEach(tmpl => {
      Handlebars.registerPartial(tmpl["id"], tmpl.innerHTML);
    });
  }

  compileTemplates() {
    document.querySelectorAll('script[type="text/x-handlebars"]').forEach(tmpl => {

      this.templates[tmpl["id"]] = Handlebars.compile(tmpl.innerHTML);
    });
  }

  renderQuizForm() {
    let template = this.templates["quizTemplate"];
    document.querySelector('fieldset').insertAdjacentHTML('beforeend', template({questions: questions}));
  }

  init() {
    this.renderQuizForm();
  }
}

class QuizApp {
  constructor() {
    this.elements = {
      form: document.querySelector('form'),
      resetBtn: document.querySelector('button.reset'),
      submitBtn: document.querySelector('input[type="submit"]'),
      allResultPs: document.querySelectorAll('p.result'),
    };
    this.init();
  }

  
  evaluateQuizResult(event) {
    event.preventDefault();
    let answers = this.retrieveAllAnswers();  // {1: "dan", 3: "a machine"}
    Object.keys(answrKey).forEach(questionNum => {
      let correctAnswer = answrKey[questionNum];
      let userAnswer = this.findAnswer(questionNum, answers);  // 'A machine' or undefined
      let resultP = this.findMatchingResultP(questionNum);
      this.evaluateUserAnswer(correctAnswer, userAnswer, resultP);
    });


    this.elements['submitBtn'].disabled = true;
  }

  retrieveAllAnswers() {
    let data = new FormData(this.elements['form']);
    let dataObj = Object.fromEntries(data.entries());
    return dataObj;
  }

  findAnswer(questionNum, answersObj) {
    let answer;
    questionNum = Number(questionNum);
    if (answersObj.hasOwnProperty(questionNum)) {
      answer = answersObj[questionNum];
    }
    return answer;
  }

  findMatchingResultP(questionNum) {
    let questionDiv = document.querySelector(`[data-id='${questionNum}']`);
    return questionDiv.querySelector('p.result');
  }

  evaluateUserAnswer(correctAnswer, userAnswer, resultP) {
    if (correctAnswer === userAnswer) {
      resultP.classList.add('correct');
      resultP.textContent = 'Correct Answer';
    } else {
      resultP.classList.add('wrong');

      if (userAnswer === undefined) {
        resultP.textContent = `You didn't answer this question. Correct answer is: "${correctAnswer}".`;
      } else {
        resultP.textContent = `Wrong Answer. The correct answer is: "${correctAnswer}".`;
      }
    }
  }


  resetQuizPage(event) {
    event.preventDefault();
    this.elements['form'].reset();
    this.elements["submitBtn"].disabled = false;
    this.elements["allResultPs"].forEach(resultP => {
      this.removeResultComment(resultP);
    });
  }

  removeResultComment(resultP) {
    resultP.textContent = '';
    resultP.classList.remove('correct');
    resultP.classList.remove('wrong');
  }

  bindEvents() {
    this.elements["resetBtn"].addEventListener('click', this.resetQuizPage.bind(this));
    this.elements['form'].addEventListener('submit', this.evaluateQuizResult.bind(this));
  }

  init() {
    this.bindEvents();
  } 
}

document.addEventListener('DOMContentLoaded', () => {
  new CreateQuizForm();
  new QuizApp();
})