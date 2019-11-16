=begin
requirement: 
  -take a decimal number and return a string (handshake)
  -1 = wink  -> 2*0 --> 1
  10 = double blink -> 2*1 --> 2
  100 = close your eyes --> 2*2 -> 4
  1000 = jump --> 2*3 -> 8
  10000 = Reverse the order of the operations in the secret handshake.
  ( --> 2 *4 -> 16)
input: 
  - integer => array of strings (ex. ['wink', 'jump'])
  - string integer ("1") => treated as integer and reutnr array of string
  - other string ==> []
data: [1,1,0,0,1]; [w,d,c,j,"",j,c,d,w,""]
algorithm:
   1. validate input
    - integer
    - string integ ("1"; "10011") --> binary
    - other string
   2. trasnform decimal to binary [1,1,0,0,1]
   3. split binary array by 5 elements [[1,1,...], [1,0,0,1...]]
   4. transform nested array to correspodent handshak [[w,d,.], [j,""]]
   5. return the result array
example:
  1     0    0    0    0
 2**4 2**3 2**2 2**1 2**0
 9 / 2 => 4 .. 1
 4 / 2 => 2 ..0
 2 / 2 => 1 ..0 
 1/ 2 => 0 ..1  (stop iterate)
=end

  class SecretHandshake
    attr_reader :decimal_num, :binaries
    HANDSHAKES = ["wink", "double blink", "close your eyes", "jump", "reverse"]
    
    def initialize(input)
     if input.is_a?(Integer)
      @decimal_num = input
     elsif valid_string?(input)
      @binaries = input.each_char.map(&:to_i)
     else
      @decimal_num = 0
     end
    end

    def commands
      @binaries = decimal_to_binary(decimal_num) unless @binaries
      grouped_binaries = group_elements_by_five(binaries)
      grouped_binaries.map do |binaries_set|
        binary_to_handshake(binaries_set)
      end.flatten
    end

    private

    def decimal_to_binary(decimal)
      binaries = []
      while decimal > 0
        quotient, remainder = decimal.divmod(2)
        binaries << remainder
        decimal = quotient
      end
      binaries
    end

    def string_to_binary(string)
      string.each_char.map(&:to_i)
    end

    def group_elements_by_five(binaries)
      grouped_binaries = []
      while !binaries.empty?
        grouped_binaries << binaries.shift(5)
      end

      grouped_binaries
    end

    def binary_to_handshake(binaries)
      # [w,d,c,j]
      handshakes = []
      binaries.each_with_index do |num, idx|
        handshakes << HANDSHAKES[idx] if num == 1
      end
      if handshakes.include?("reverse")
        handshakes.reverse!.shift
      end

      handshakes
    end

    def valid_string?(string)
      /\A\d+\z/.match?(string) && "23456789".count(string) == 0
    end
  end



  
  
