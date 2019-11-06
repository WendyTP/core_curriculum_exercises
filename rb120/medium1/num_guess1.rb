class GuessingGame
  TOTAL_GUESSES = 7
  def initialize
    # something
  end

  def play
    @num_guesses = TOTAL_GUESSES
    @correct_ans = rand(1..100)

    ans = nil

    @num_guesses.downto(1) do |num|
      puts "You have #{num} guesses remaining."

      loop do
        print "Enter a number between 1 and 100: "
        ans = gets.chomp
        break if valid?(ans)
        puts "Invalid guess."
      end

      ans = ans.to_i

      if ans < @correct_ans 
        puts "Your guess is too low."
      elsif ans > @correct_ans 
        puts "Your guess is too high."
      else
        puts "That's the number!"
        break
      end
    end

    if ans == @correct_ans
      puts "Yon won!"
    else
      puts "You have no more guesses. You lost!"
    end
  end

  def valid?(num)
    /\A\d+\z/.match?(num)
  end
end

game = GuessingGame.new
game.play













