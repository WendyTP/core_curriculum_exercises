# PEDAC 



## Understand the problem

### *Identify expected input and output*

#### input :

1. integer

#### output:

1. returns `true` , if the number's absolute value is odd (1,3,5,...)

### *Make the requirements explicit*

Absolute value : distance of a number from itself to zero 

### *Identify rules*

#### rule:

** Assume the argument is a valid integer value --> no need to test it**

integer can be positive, negative or zero

(0 is not an odd number)

## Example/ Test case

### *Validate understanding of the problem*

Example 1: 

input : 0

output: false

input: -3

output: true

input: 3

output: true

Edge cases:

Bad inputs: no inputs; float numbers; any other symbols 



## Data Structure

#### *How we represent data that we will work with when converting the input to output*

#### input: 

integer number

#### output:

true / false

#### rule/ requirement:

odd number : number % 2 != 0 

## Algorithm

### *Steps for converting input to output*

#### Pseudo code:

Given a valid integer (either positive or negative or 0)

get the absolute value of that integer

save the absolute value in a variable

if  variable % 2 != 0 (odd number / 2 will have remainder)

​	return true



#### Formal Pseudo code:

| keyword             | meaning                              |
| ------------------- | ------------------------------------ |
| START               | start of the program                 |
| SET                 | sets a variable we can use for later |
| GET                 | retrieve input from user             |
| PRINT               | displays output to user              |
| READ                | retrieve value from variable         |
| IF / ELSE IF / ELSE | show conditional branches in logic   |
| WHILE               | show looping logic                   |
| END                 | end of the program                   |





#### Flowchart:





