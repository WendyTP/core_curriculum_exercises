/*
1.reset click event
  - stop timer (if its running)
  - resset all counter to '00'
2.start/ stop click event
 2.1 stop event:
  - stop timer
  - change btn text to "Start"
 2.2 start event:
  - start/ continue timer
  - change btn text to "Stop"

3. get real time
4.  record and continue count of  each counter 
5. modify the span text to reflect the record for each counter
  - reset to 0 after reaching x (for both record and display text)
  - add '0' to display text if record time is less than 10


*/


  class Timer {
    /* record time passing
    */

    constructor() {
      this.count = 0;
      this.resetCounters();
    }

    increment() {
      this.count += 1;
      this.incrementCentisec();
    }

    incrementCentisec() {
      this.centiseconds += 1;
      if (this.centiseconds === 100) {
        this.centiseconds = 0;
        this.incrementSec();
      }
    }

    incrementSec() {
      this.seconds += 1;
      if (this.seconds === 60) {
        this.seconds = 0;
        this.incrementMin();
      }
    }

    incrementMin() {
      this.mins += 1;
      if (this.mins === 60) {
        this.mins = 0;
        this.incrmentHour();
      }
    }

    incrmentHour() {
      this.hours += 1;
    }

    resetCounters() {
      // reset counter records to 0
      this.hours = 0;
      this.mins = 0;
      this.seconds = 0;
      this.centiseconds = 0;
    }

    getCurrentCounters() {
      // return obj ex {hr:0, min: 1, sec: 20, centisec: 90};
      return {
        hours: this.hours,
        mins: this.mins,
        seconds: this.seconds,
        centiseconds: this.centiseconds,
      };
    }
  }

  class StopwatchApp {
    // add events
    // create new Timer 
    // reset: reset new Timer obj's initial status

    constructor() {
      this.intervalId = null;
      this.delayTimeInMilliseconds = 10;
      this.timer = new Timer();
      this.elements = {
        startStopBtn:  document.querySelector('.toggle'),
        resetBtn: document.querySelector('.reset'),
        counterSpans: document.querySelectorAll('span'),
      };
      this.init();
    }

    reset() {
      // reset new Timer obj's initial status
      // reset display board to '00'
      this.timer.resetCounters();
      this.resetCounterDisplay();
    }

    resetCounterDisplay() {
      let spans = Array.prototype.slice.call(this.elements['counterSpans']);
      spans.forEach(span => {
        span.textContent = '00';
      })
    }

    startOrStopCounter() {
      if (this.elements['startStopBtn'].textContent === 'Start') {
   
        this.startCounting();
      } else {
  
        this.stopCounting();
      }
    }

    startCounting() {
      // setInterval(this.timer.increment.bind(this), ...)
      // display changes on page based on returned obj
      this.intervalId = setInterval(() => {
        this.timer.increment();
        this.displayCounters();
      }, this.delayTimeInMilliseconds);
   
      this.displayCounters();
      // change Start to Stop at btn text
      this.toggleStartStop();
    }

    stopCounting() {
      // clearInterval
      clearInterval(this.intervalId);
      this.intervalId = null;
      // change Stop to Start at btn text
      this.toggleStartStop();
    }

    displayCounters() {
      let currentCounters = this.timer.getCurrentCounters();
      let spans = Array.prototype.slice.call(this.elements['counterSpans']);
      spans.forEach(span => {
        let spanType = span.getAttribute('class');
        let matchingCounter = Object.keys(currentCounters).filter(key => key === spanType)[0];
        let counterValue = currentCounters[matchingCounter]; 
        this.drawCounter(span, counterValue);
      });
    }

    drawCounter(spanElement, counterValue) {
      counterValue = String(counterValue);

      if (counterValue < 10) {
        counterValue = '0' + counterValue;
      }
      spanElement.textContent = String(counterValue);
    }

    toggleStartStop() {
      if (this.elements['startStopBtn'].textContent === 'Start') {
        this.elements['startStopBtn'].textContent = 'Stop';
      } else {
        this.elements['startStopBtn'].textContent = 'Start';
      }
    }

  

    bind() {
      this.elements['startStopBtn'].addEventListener('click', this.startOrStopCounter.bind(this));
      this.elements['resetBtn'].addEventListener('click', this.reset.bind(this));
    }

    init() {
      this.bind();
    }
  }

  document.addEventListener('DOMContentLoaded', () => {
    new StopwatchApp();
  });


