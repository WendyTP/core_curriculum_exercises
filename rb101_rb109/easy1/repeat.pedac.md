# PEDAC 



## Understand the problem

### *Identify expected input and output*

#### input :

1. a string
2. a string form of a positive integer ( > 0)

#### output:

1. strings printed out as many time as the integer inicates

### *Make the requirements explicit*

Write a method

Only takes string and positive integer as input



### *Identify rules*

#### rule:

## Example/ Test case

### *Validate understanding of the problem*

Example 1: 

input : "hello world" ; 2

output: "hello world"; "hello world"

Example 2: "a" ; 5

output: "a"; "a"; "a"; "a", "a"

Edge cases:

input: str = "    " ; 2

output: "    "; "    "

(str.length = 4)



Bad inputs: 

string: No input ("")

number: negative; float; 0; no input; anything other than number



## Data Structure

#### *How we represent data that we will work with when converting the input to output*

#### input: 

String --> string

positive integer --> string of number 

#### output:

positive integer --> transformed from string to integer

separated strings

#### rule/ requirement:



## Algorithm

### *Steps for converting input to output*

#### Pseudo code:

Request for first input - string

Validate the input

​	If input is valid, continue to the second question

​	otherwise, ask for the input again

Request for second input - positive integer

Validate the input

​	if input is valid, continue the rest of programme

​	otherwise, ask for the input again

Transform the integer input from string to integer

Repeat the strings (integer) times and print the result



**Validate a string:  **

No input ("")

String with only space ("    ") 

ex. str= "    " or ""

array = str.split  ( => [ ])

array.length = 0

or regex /./m && / \S /  (  /./m: any character; /\S/: a non-whitespace character)

**Validate a positive integer:**

either input.to_i.to_s == input  && input.to_i > 0

or regex /^ \d+ $/ 

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





