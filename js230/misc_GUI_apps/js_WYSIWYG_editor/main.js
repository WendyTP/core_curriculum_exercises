class Editor {
  constructor() {
    this.buttons = {
      bold: document.querySelector('#bold'),
      italic: document.querySelector('#italic'),
      underline: document.querySelector('#underline'),
    }
    this.bindEvents();
  }

  bindEvents() {
    Object.keys(this.buttons).forEach(key => {
      this.buttons[key].addEventListener('click', this.handleClick.bind(this));
    });
  }
  
  handleClick(event) {
    let command = event.target.id;
    document.execCommand(command);
    let state = document.queryCommandState(command);

    if (state) {
      event.target.classList.add('chosen');
    } else {
      event.target.classList.remove('chosen');
    }

    document.querySelector('div.text-box').focus();
  }
}

document.addEventListener('DOMContentLoaded', () => {
  new Editor();

})