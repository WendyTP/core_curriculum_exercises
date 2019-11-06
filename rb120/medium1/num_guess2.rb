class GuessingGame
  RESULT_OF_GUESS_MESSAGE = {
    high: "Your number is too high.",
    low: "Your number is too low.",
    match: "That's the number!"
  }.freeze

  private 

  attr_reader :secret_num, :guess_range, :total_guesses

  public

  def initialize(lowest_guess, highest_guess)
    @secret_num = nil
    @guess_range = (lowest_guess..highest_guess)
    @total_guesses = Math.log2(guess_range.size).to_i + 1
  end


  def play
    @secret_num = rand(guess_range)

    game_result = play_game
  
    display_result(game_result)
  end

  private

  def play_game
    result = nil
    total_guesses.downto(1) do |num|
      display_remaining_guesses(num)
      ans = input_guess.to_i
      result = check_guess(ans)
      puts RESULT_OF_GUESS_MESSAGE[result]
      break if result == :match
    end

    result
  end

  def display_remaining_guesses(reamin_guesses)
    puts 
    if reamin_guesses == 1
      puts "You have 1 guess remaining."
    else
      puts "you have #{reamin_guesses} guess remaining."
    end
  end

  def input_guess
    answer = nil
    loop do
      print "Enter a number between #{guess_range.first} and #{guess_range.last}: "
      answer = gets.chomp
      break if valid?(answer)
      puts "Invalid guess."
    end
    answer
  end

  def valid?(num)
    /\A\d+\z/.match?(num) && guess_range.cover?(num.to_i)
  end

  def check_guess(guess)
    return :match if guess == secret_num
    return :low if guess < secret_num
    :high
  end

  def display_result(result)
    puts (result == :match) ? "You won!" : "You have no mor guesses. You lost!"
  end 
end

game = GuessingGame.new(1,45)
game.play













