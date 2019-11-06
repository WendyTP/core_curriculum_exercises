=begin
requirment1: write down your own observations for each group of code
requirement2: write final analysis that explains the differences between procs, blocks and lambdas
=end

=begin
Final analysis:
  1. Proc and Block have lenient arity, meaning Ruby won't throw ArgumentError
    if the amount of arguments passed into block doesn't match to that of block parameters
  2. lambda (Constructing a proc with lambda semantics) has strict arity.
  3. To invoke a block of Proc or lambda, we need to use Proc#call
  4. Regular blocks are linked to a method invocation. The block argument is passed in via the method definition.



=end
# Group 1 => Proc
my_proc = proc { |thing| puts "This is a #{thing}." }
  # Initialize `my_proc` local var. to a Proc object (by using Kernel#proc). Nothing output
  # Another way is by using Proc#new
puts my_proc
  # <Proc:0x00005605f93d6dc8@procs_lambda_arity.rb:7>

puts my_proc.class
  # Proc

my_proc.call
  # #call is needed for invoking the Proc block
  # Proc is like block that can take less or more arguments than needed
  # "This is a ." (The missing parameter is set to `nil`)

my_proc.call('cat', 'dog')
  # "This is a cat." (The extra parameter is silently discarded)

my_proc.call('cat')
  # since the block has 1 block parameter, we need to pass in one argument when calling
  # "This is a cat."


# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
  # Construct a Proc object with lambda semantics (using Kernel#lambda)

my_second_lambda = -> (thing) { puts "This is a #{thing}." }
  # Construct a Proc object with lambda semantics (using Lambda literal syntax)

puts my_lambda
  #<Proc:0x0000562cbfeae470@procs_lambda_arity.rb:31 (lambda)>

puts my_second_lambda
  #<Proc:0x000055f361c8a528@procs_lambda_arity.rb:33 (lambda)>

puts my_lambda.class
  # Proc

puts my_lambda.lambda?
  # To tell a lambda from a regular proc by using the #lambda? instance method.
  # true

my_lambda.call('dog')
  # use the Proc#call method to invoke the block
  # "This is a dog."
my_lambda.call
  # ArgumentError will be raised if we don't invoke the block with correct amount of arguments
  # wrong number of arguments (given 0, expected 1) (ArgumentError)

my_second_lambda.call("cat", "dog")
  # wrong number of arguments (given 2, expected 1) (ArgumentError)

my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }
  # There is no Lambda class in Ruby.
  # uninitialized constant Lambda (NameError)


# Group 3
def block_method_1(animal)
  yield
end
  # the `block_method_1` method takes an implicit block

block_method_1('seal') { |seal| puts "This is a #{seal}."}
  # The block takes 1 argument, but we did not pass in any. Therefore, the parameter is set to `nil`
  # "This is a ."

  block_method_1('seal')
 # no block given (yield) (LocalJumpError)


# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
  # "This is a turtle."

  block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
  # The block has 2 block param. Since only 1 argument is passed in, the second block
  # parameter is set to `nil`.
  # "This is a turtle and a ."

block_method_2('turtle') { puts "This is a #{animal}."}
# If a block has block parameters, it is fine if the block does not use those parameters, but not vice-versa.  
# undefined local variable or method `animal' for main:Object (NameError)

 


