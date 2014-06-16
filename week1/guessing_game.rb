class GuessingGame
  def initialize
    @answer = 5
  end

  def play 
    won = false
    print "Guess a number 1-10: "

    3.times do
      guess = gets.to_i

      if guess == @answer
        won = true
        return
      else
        puts "Incorrect!"
      end
    end

    if won
      puts "Correct!"
    else
      puts "The answer was #{@answer}"
    end
  end
end

guessing_game = GuessingGame.new
guessing_game.play