# bonus challenge: no condition nor case statement

class BeerSong
  attr_reader :verse_num
  
  VERSE_CHOICES = {
    [0] => :zero_bottle,
    [1]=> :one_bottle,
    [2] => :two_bottle,
    (3..99).to_a=> :three_or_more_bottle
  }
  def verse(verse_num)
    @verse_num = verse_num
    choice = VERSE_CHOICES.keys.find {|k| k.include?(verse_num)}
    result = send(VERSE_CHOICES[choice])
  end

  def verses(*verse_nums)
    arr_of_verse_nums = *verse_nums

    verse_result = ""

    arr_of_verse_nums[0].downto(arr_of_verse_nums[-1]) do |num|
      verse_result << verse(num) << "\n"
    end

    verse_result.chomp
  end

  def lyrics
    verses(99,0)
  end

  private 

  def zero_bottle
    verse = "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    verse
  end

  def one_bottle
    verse = "1 bottle of beer on the wall, 1 bottle of beer.\n" \
    "Take it down and pass it around, no more bottles of beer on the wall.\n"
    verse
  end

  def two_bottle
    verse = "2 bottles of beer on the wall, 2 bottles of beer.\n" \
    "Take one down and pass it around, 1 bottle of beer on the wall.\n"
  end

  def three_or_more_bottle
    verse = "#{verse_num} bottles of beer on the wall, #{verse_num} bottles of beer.\n" \
    "Take one down and pass it around, #{verse_num-1} bottles of beer on the wall.\n"
  end
end
