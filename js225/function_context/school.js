let school = (() => {
  let students= [];
  let validYears = ['1st', '2nd', '3rd', '4th', '5th'];

  return {
    addStudent(studentName, year){
      if (validYears.includes(year)) {
        let newStudent = createStudent(studentName, year);
        students.push(newStudent);
        return newStudent;
      } else {
        console.log('Invalid Year!');
      }
    },

    enrollStudent(student, courseName, code) {
      student.addCourse({name: courseName, code: code});
    },

    addGrade(student, courseName, grade) {
      let selectedCourse = this.getCourse(student, courseName);
      
      if (selectedCourse) {
        selectedCourse['grade'] = grade;
      }
    },

    getReportCard(student) {
      student.listCourses().forEach(course => {
        if (course.grade) {
          console.log(`${course.name}: ${course.grade}`);
        } else {
          console.log(`${course.name}: In progress`);
        }
      })
    },

    courseReport(courseName) {
      let allGrades = this.CourseGrades(courseName);

      if (allGrades.length > 0) {
        console.log(`=${courseName} Grades=`);

        allGrades.forEach(student => {
          console.log(`${student.name}: ${student.grade}`);
        })

        console.log('---')
        console.log(`Course Average: ${this.courseAverage(courseName)}`)

      }
    },

    getCourse(student, courseName) {
      return student.listCourses().filter(course => { return course.name === courseName})[0];
    },

    CourseGrades(courseName) {
      // [{name: foo, grade: 95}, {name: bar, grade: 90}]
      return students.map(student => {
        let course = this.getCourse(student, courseName);   // {name: 'Math', code: 101, grade: 93}  or undefined
        if (course) {
          return {name: student.name, grade: course.grade};
        } else {
          return {name: student.name, grade: undefined};
        }
      }).filter(student => {return student.grade});
    },

    courseAverage(courseName) {
      let allGrades = this.CourseGrades(courseName);

      if (allGrades.length > 0) {
        let gradesSum = allGrades.reduce((sum, student) => {
          return sum += student.grade;
        }, 0)

        return Math.round(gradesSum / allGrades.length);
      }
    },
  };
})();



function createStudent(studentName, year) {
return  {
  name: studentName, 
  year: year,
  courses: [],
  notes: {},   // {'Math': ['xxx', 'xxxx'], 'Algebra': ['xxxxx', 'xxx']}

  info() {
    console.log(`${this.name} is a ${this.year} year student`);
  },

  listCourses() {
    return this.courses;
  },

  addCourse(course) {
    this.courses.push(course);
  },

  addNote(code, note) {
    let courseName = this.findCourse(code);

    if (Object.keys(this.notes).includes(courseName)) {
      this.notes[courseName].push(note);
    } else {
      this.notes[courseName] = [note];
    }
  },

  viewNotes() {
    Object.keys(this.notes).forEach(courseName => {
      console.log(`${courseName}: `+ `${this.notes[courseName].join('; ')}`);
    })
  },

  updateNote(code, note) {
    let courseName = this.findCourse(code);
    this.notes[courseName] = [note];
  },

  findCourse(code) {
    return this.courses.filter(course => {
      return course.code === code;
    })[0].name;
  },

}
}

console.log(school.students);  // []

/*
let foo = school.addStudent('foo', '3rd');
//console.log(school.addStudent('foo', '3rd'));
//console.log(school.addStudent('b', '6th'))  // invalid year!
let bar = school.addStudent('bar', '1st');
let qux = school.addStudent('qux', '2nd');

school.enrollStudent(foo, 'Math', 101);
school.enrollStudent(foo, 'Advanced Math', 102);
school.enrollStudent(foo, 'Physics', 202);

school.enrollStudent(bar, 'Math', 101);

school.enrollStudent(qux, 'Math', 101);
school.enrollStudent(qux, 'Advanced Math', 102);

school.addGrade(foo, 'Math', 95);
school.addGrade(foo, 'Advanced Math', 90);

school.addGrade(bar, 'Math', 91);

school.addGrade(qux, 'Math', 93);
school.addGrade(qux, 'Advanced Math', 90);

//school.getReportCard(foo)
//school.courseReport('Math');
school.courseReport('Advanced Math')
school.courseReport('Physics')  // return undefined

//console.log(school.courseAverage('Advanced Math'))
*/