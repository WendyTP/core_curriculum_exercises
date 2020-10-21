const TODAY = toDate("2018-08-05");

function toDate(string) {
  return new Date(`${string}`);
}

function toString(date) {
  //return `${date.getFullYear()}-${date.getMonth() + 1}-${date.getDate()}`;
  let stringYear = String(date.getFullYear());
  let stringMonth = String(date.getMonth() + 1);
  let stringDate = String(date.getDate());
  stringMonth = stringMonth.length === 1 ? '0' + stringMonth : stringMonth;
  stringDate = stringDate.length === 1 ? '0' + stringDate : stringDate;
  return `${stringYear}-${stringMonth}-${stringDate}`;
}

function isInThePast(date) {
  return date < TODAY;
}

function isWeekday(date) {
  return date.getDay() >= 1 &&
         date.getDay() <= 5;
}

const myCalendar = {
  "2018-08-13": ["JS debugging exercises"],
  "2018-08-14": ["Read 'Demystifying Rails'", "Settle health insurance"],
  "2018-08-15": ["Read 'Demystifying Rails'"],
  "2018-08-16": [],
  "2018-08-30": ["Drone video project plan"],
  "2018-09-10": ["Annual servicing of race bike"],
  "2018-09-12": ["Study"],
  "2018-11-02": ["Birthday Party"],
  "2018-11-03": ["Birthday Party"],
};

const offeredClasses = {
  "Back To The Future Movie Night": ["2018-07-30"],
  "Web Security Fundamentals": ["2018-09-10", "2018-09-11"],
  "Pranayama Yoga For Beginners": ["2018-08-30", "2018-08-31", "2018-09-01"],
  "Mike's Hikes": ["2018-08-16"],
  "Gordon Ramsey Master Class": ["2018-09-11", "2018-09-12"],
  "Powerboating 101": ["2018-09-15", "2018-09-16"],
  "Discover Parachuting": ["2018-11-02"],
};

function getCompatibleEvents(classes, calendar) {
  function isAvailable(date) {
    const dateStr = toString(date);
    return !calendar[dateStr] || calendar[dateStr].length === 0;
  };

  const compatibleClasses = [];

  Object.keys(classes).forEach(className => {
    const classDates = classes[className].map(toDate);

    if (classDates.some(isInThePast)) {
      return;
    }

    if (classDates.filter(isWeekday).every(isAvailable)) {
      compatibleClasses.push(className);
    }
  });

  return compatibleClasses;
}

console.log(getCompatibleEvents(offeredClasses, myCalendar));
// expected: ["Mike's Hikes", "Powerboating 101"]

/*
function isAvailable(date) {
  console.log(date)
  const dateStr = toString(date);
  console.log(dateStr)
  return  !myCalendar[dateStr] || myCalendar[dateStr].length === 0;
};

console.log(isAvailable(toDate('2018-09-12')))
*/

