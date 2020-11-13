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



foo = createStudent('Foo', '1st');
foo.info();  //"Foo is a 1st year student"

console.log(foo.listCourses()); //[];

foo.addCourse({ name: 'Math', code: 101 });
foo.addCourse({ name: 'Advanced Math', code: 102 });

console.log(foo.listCourses());
//[{ name: 'Math', code: 101 }, { name: 'Advanced Math', code: 102 }]

foo.addNote(101, 'Fun course');
foo.addNote(101, 'Remember to study for algebra');

foo.viewNotes();
// "Math: Fun course; Remember to study for algebra"

foo.addNote(102, 'Difficult subject');

foo.viewNotes();
// "Math: Fun course; Remember to study for algebra"
// "Advanced Math: Difficult subject"

foo.updateNote(101, 'Fun course');

foo.viewNotes();
// "Math: Fun course"
// "Advanced Math: Difficult subject"
