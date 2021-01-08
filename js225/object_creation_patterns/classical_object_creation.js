function Person(firstName, lastName, age, gender) {
  this.firstName = firstName;
  this.lastName = lastName;
  this.age = age;
  this.gender = gender;
}

Person.prototype.fullName = function () {
  return this.firstName + ' ' + this.lastName;
};

Person.prototype.communicate = () => { return 'Communicating'};
Person.prototype.eat = () => { return 'Eating' };
Person.prototype.sleep = () => { return 'Sleeping' };

function Doctor(firstName, lastName, age, gender, specialization) {
  Person.call(this, firstName, lastName, age, gender);
  this.specialization = specialization;
}

Doctor.prototype = Object.create(Person.prototype);
Doctor.prototype.constructor = Doctor;
Doctor.prototype.diagnose = () => { return 'Diagnosing'};

function Student(firstName, lastName, age, gender, degree) {
  Person.call(this, firstName, lastName, age, gender);
  this.degree = degree;
}

Student.prototype = Object.create(Person.prototype);
Student.prototype.constructor = Student;
Student.prototype.study = () => {return 'Studying'};

function GraduateStudent(firstName, lastName, age, gender, degree, graduateDegree) {
  Student.call(this, firstName, lastName, age, gender, degree);
  this.graduateDegree = graduateDegree;
}

GraduateStudent.prototype = Object.create(Student.prototype);
GraduateStudent.prototype.constructor = GraduateStudent;
GraduateStudent.prototype.research = () => {return 'researching'};


/*
const person = new Person('foo', 'bar', 21, 'gender');
console.log(person instanceof Person);     // logs true
console.log(person.eat());                              // logs 'Eating'
console.log(person.communicate());                      // logs 'Communicating'
console.log(person.sleep());                            // logs 'Sleeping'
console.log(person.fullName());            // logs 'foo bar'

const doctor = new Doctor('foo', 'bar', 21, 'gender', 'Pediatrics');
console.log(doctor instanceof Person);     // logs true
console.log(doctor instanceof Doctor);     // logs true
console.log(Doctor.prototype.constructor)  // logs [Function: Doctor]
doctor.eat();                              // logs 'Eating'

doctor.communicate();                      // logs 'Communicating'
doctor.sleep();                            // logs 'Sleeping'
console.log(doctor.fullName());            // logs 'foo bar'
console.log(doctor.diagnose());                         // logs 'Diagnosing'
*/


const graduateStudent = new GraduateStudent('foo', 'bar', 21, 'gender', 'BS Industrial Engineering', 'MS Industrial Engineering');
// logs true for next three statements
console.log(graduateStudent instanceof Person);
console.log(graduateStudent instanceof Student);
console.log(graduateStudent instanceof GraduateStudent);
console.log(graduateStudent.eat());                     // logs 'Eating'
graduateStudent.communicate();             // logs 'Communicating'
graduateStudent.sleep();                   // logs 'Sleeping'
console.log(graduateStudent.fullName());   // logs 'foo bar'
console.log(graduateStudent.study());                   // logs 'Studying'
console.log(graduateStudent.research());                // logs 'Researching'
