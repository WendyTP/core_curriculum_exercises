=begin
input: s tring
output: a boolean of true or false
rules:
  - Write a method that returns true if the word passed in as an argument 
  can be spelled from this set of blocks.
  - This limits the words you can spell with the blocks to just those words that
   do not use both letters from any given block. 
  - Each block can only be used once.
algorithm:
    - data structute represent the spelling block

=end

# first attempt

def initiate_spelling_block
  spelling_block = {
    ["B","O"] => 0,
    ["X", "K"] => 0,
    ["D", "Q"] => 0,
    ["C", "P"] => 0,
    ["N", "A"] => 0,
    ["G", "T"] => 0,
    ["R", "E"] => 0,
    ["F", "S"] => 0,
    ["J", "W"] => 0,
    ["H", "U"] => 0,
    ["V", "I"] => 0,
    ["L", "Y"] => 0,
    ["Z", "M"] => 0
  }
end

def associate_charcter_to_block(char, spell_block)
  spell_block.keys.each do |key|
    if key.include?(char.upcase)
      spell_block[key] += 1
    end
  end
end

def block_word?(word)
  spelling_block = initiate_spelling_block
  word.chars.each do |char|
    associate_charcter_to_block(char,spelling_block)
    return false if spelling_block.values.include?(2)
  end
  true
end


# another solution: using string blocks and String#count
=begin
SPELLING_BLOCK = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM)

def block_word?(word)
  uppercased_word = word.upcase
  SPELLING_BLOCK.none? do |block|
    uppercased_word.count(block) >=2
  end
end  
=end

puts block_word?("BATCH")
puts block_word?("BUTCH")
puts block_word?("jest")