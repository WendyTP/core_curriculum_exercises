=begin
redo pig_latin exercise, using Regex
algorithm:
   - split phrase into words
   - if word starts with vowl-- transform to piglatin
  - transform rest of words not start with vowel
  - return the transformed phrase
=end

class PigLatin

  def self.translate(phrase)
    words = phrase.split
    words.map do |word|
      if word_begin_with_vowel?(word)
        word + "ay"
      else
        splitted_word = split_word_begin_with_consonant(word)
        consonant_part, rest_of_word = splitted_word.first, splitted_word.last
        rest_of_word + consonant_part + "ay"
      end
    end.join(" ")
  end

  def self.word_begin_with_vowel?(word)
    word.match(/\A[aeiou]|[xy][^aeiou]/)
  end

  def self.split_word_begin_with_consonant(word)
    splitted_word = word.scan(/\A([^aeiou]*qu|[^aeiou]+)([aeiou].*)\z/)
    splitted_word.flatten
  end
end