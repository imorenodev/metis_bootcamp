class Card
  attr_accessor :front, :back

  def initialize(a_card) # passed hash {front: "gato", back: "cat"}
    @front = a_card[:front]
    @back = a_card[:back]
  end

  def play
    puts "Type the English word for the card shown."

    display_card
    make_guess
  end

  def display_card
    print "#{front}: "
  end

  def make_guess
    guess = gets.chomp

    if guess == back  # back is defined in attr_accessor with the symbol :back. :back.to_s will print the string ":back" explicitly, not the value of @back/back (which should be the string "cat")
      puts "Correct!"
    else
      puts "Oops! Try Again."
    end
  end
end

new_game = Card.new(front: "gato", back: "cat") # passing a hash to the initialize constructor
new_game.play