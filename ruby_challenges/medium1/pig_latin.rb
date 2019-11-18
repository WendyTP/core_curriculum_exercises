=begin
requirement: turn a word into a pig latin word
Rule 1: If a word begins with a vowel sound, add an "ay" sound to the end of the word.
 - apple  -> apple ay (appleay)
 - ear    -> ear ay
 - i/o/u  -> i/o/u   ay

Rule 2: If a word begins with a consonant sound (one consonant or several before vowel), move it to the end of the word, 
        and then add an "ay" sound to the end of the word.
 - pig   -> ig p ay (igpay)
 - koala -> oala k ay
 - chair -> air ch ay
 - therapy -> erapy th ay
 - thrush -> ush thr ay
 - school -> ool sch ay

exceptions: 
- qu + vowel (queen)     -> Rule 2  -> een qu ay
- squ + vowel (square)   -> Rule 2   -> are squ ay
- y + consonant (yttria) -> Rule 1  -> yttria ay
- y + vowel (yellow)     -> Rule 2  -> ellow y ay
- x + consonant (xray)   -> Rule 1  -> xray  ay
- x + vowel (xenon)      -> Rule 2  -> enon x ay

algorithm:
  - check exceptions
  - check rule 1
  - check rule 2
data: array of letters
=end

class PigLatin
  def self.translate(word)
    if word.match(/\s/)
      split_words = word.split
      split_words.map do |word|
        @@letters = word.split("")
        translate_single_word
      end.join(" ")
    else
      @@letters = word.split("")
      translate_single_word
    end
  end

  def self.translate_single_word
    if x_or_y_beginning_word?
      translate_x_or_y_beginning_word
    elsif qu_beginning_word_or_consonant_preceding_qu_word?
      translate_qu_beginning_word
    elsif vowel_beginning_word?
      translate_vowel_beginning_word
    else
      translate_consonant_beginning_word
    end
  end

  def self.translate_vowel_beginning_word
    (@@letters.join) + "ay"
  end

  def self.translate_consonant_beginning_word
    consonant_beginnings = []
    loop do
      consonant_beginnings << @@letters.shift
      break if @@letters.first.match(/[aeiouy]/)
    end
  
    (@@letters + consonant_beginnings).flatten.join + "ay"
  end

  def self.translate_x_or_y_beginning_word
    if @@letters[1].match(/[aeiou]/)
      translate_consonant_beginning_word
    else
      translate_vowel_beginning_word
    end
  end

  def self.x_or_y_beginning_word?
    @@letters[0].match(/[xy]/)
  end

  def self.vowel_beginning_word?
    @@letters[0].match(/[aeiou]/)
  end

  def self.qu_beginning_word_or_consonant_preceding_qu_word?
    @@letters[0,2] == ["q", "u"] || @@letters[1,2] == ["q", "u"]
  end

  def self.translate_qu_beginning_word
    consonant_beginnings = []
    loop do
      consonant_beginnings << @@letters.shift
      break if @@letters.first.match(/[aeioy]/)
    end
    (@@letters + consonant_beginnings).flatten.join + "ay"
  end
    
end



