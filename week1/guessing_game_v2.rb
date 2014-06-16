class GuessingGame
  def initialize
    @answer = rand(1..10)
    @won = false
    @wins = 0
    @rounds = 5
    @rounds_played = 1
    @guesses = 0
  end

  def play_rounds
      @rounds.times do
        puts "Round #{@rounds_played}"
        @won = false

        play

        print_result
        @rounds_played += 1
      end

      print_final_result
  end

  def play 
      3.times do
        make_guess
        if @won
          @wins += 1
          break
        end
      end
  end

  def make_guess
    print "Guess a number 1-10: "
    @guesses += 1
    guess = gets.to_i

    if guess == @answer
      @won = true
    else
      puts "Incorrect!"
    end
  end

  def print_result
    if @won
      puts "Correct!"
    else
      puts "The answer was #{@answer}"
    end
  end

  def print_final_result
    puts "Number of wins: #{@wins}"
    puts "Average number of guesses per round: #{@guesses.to_f / @rounds}"
  end
end

guessing_game = GuessingGame.new
guessing_game.play_rounds