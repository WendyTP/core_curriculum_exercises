class Person {
  constructor(firstName, lastName, age, gender) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.age = age;
    this.gender = gender;
  }

  communicate() {
    return 'Communicating';
  }

  eat() {
    return 'Eating';
  }

  sleep() {
    return 'Sleeping';
  }

  fullName() {
    return this.firstName + ' ' + this.lastName;
  }
}



class Doctor extends Person {
  constructor(firstName, lastName, age, gender, specialization) {
    super(firstName, lastName, age, gender);
    this.specialization = specialization;
  }

  diagnose() {
    return 'Diagnosing';
  }
}



class Student extends Person {
  constructor(firstName, lastName, age, gender, degree) {
    super(firstName, lastName, age, gender);
    this.degree = degree;
  }

  study() {
    return 'Studying';
  }
 
}


class GraduateStudent extends Student {
  constructor(firstName, lastName, age, gender, degree, graduateDegree) {
    super(firstName, lastName, age, gender, degree);
    this.graduateDegree = graduateDegree;
  }
  
  research() {
    return 'researching';
  }
}


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
