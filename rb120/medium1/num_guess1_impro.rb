class GuessingGame
  TOTAL_GUESSES = 7

  private 

  attr_reader :correct_ans

  public

  def initialize
    @correct_ans = nil
  end


  def play
    @correct_ans = rand(1..100)

    ans = nil

    TOTAL_GUESSES.downto(1) do |num|
      display_remaining_guesses(num)
      ans = input_guess.to_i

      if ans < correct_ans
        puts "Your guess is too low."
      elsif ans > correct_ans
        puts "Your guess is too high."
      else
        puts "That's the number!"
        break
      end
    end

    display_result(ans)
  end

  private

  def display_remaining_guesses(reamin_guesses)
    puts 
    if reamin_guesses == 1
      puts "You have 1 guess remaining."
    else
      puts "you have #{reamin_guesses} guess remaining."
    end
  end

  def input_guess
    ans = nil
    loop do
      print "Enter a number between 1 and 100: "
      ans = gets.chomp
      break if valid?(ans)
      puts "Invalid guess."
    end
    ans
  end

  def valid?(num)
    /\A\d+\z/.match?(num)
  end

  def display_result(answer)
    puts (answer == correct_ans) ? "You won!" : "You have no mor guesses. You lost!"
  end 
end

game = GuessingGame.new
game.play













