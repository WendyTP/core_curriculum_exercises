=begin
requirement:
  - generate the lyrics of the 99 bottle of beer song
input: 1 or more integer 
output: strings (song verse)
rules:
      verse_num : (3..99) -- standard verse
      " #{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
      "Take one down and pass it around, #{num-1} bottles of beer on the wall.\n"
  - verse_num == 2
    "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
  - verse_num == 1
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
  - verse_num == 0
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
=end


class BeerSong

  def verse(verse_num)
    case verse_num
    when 0 then zero_bottle
    when 1 then one_bottle
    when 2 then two_bottle
    when (3..99) then three_or_more_bottle(verse_num)
    end
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

  def three_or_more_bottle(num)
    verse = "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
    "Take one down and pass it around, #{num-1} bottles of beer on the wall.\n"
  end

end

puts BeerSong.new.verses(99, 98)