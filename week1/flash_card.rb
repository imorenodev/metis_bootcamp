class Card
  attr_reader :front

  def initialize(front, back)
    @front = front
    @back = back
  end

  def play
    puts "Type the English word for the card shown."

    display_card
  end

  def display_card
    print "#{front}: "
  end

end

wombat = Card.new("gato", "cat")
wombat.play
