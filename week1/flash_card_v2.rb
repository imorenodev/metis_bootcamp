class Card
  def initialize(a_card) # passed hash {front: "gato", back: "cat"}
    @front = a_card[:front]
    @back = a_card[:back]
  end

  def play
    display_card
    make_guess
  end

  def display_card
    print "#{front}: "
  end

  def make_guess
    guess = gets.chomp

    correct?(guess)
  end

  private

  attr_reader :front, :back

  def correct?(guess)
    if guess.downcase == back.downcase
      puts "Correct!"
    else
      puts "Terrible guess :("
    end
  end

end

class Deck
  attr_reader :name, :cards

  def initialize(name, cards)
    @name = name
    @cards = cards
  end

  def play
    welcome(name)
    cards.shuffle.each do |card|
      card.play
    end
  end

  def welcome(name)
    message = "Welcome! You're using the #{name} deck"
    puts message
    puts "-" * message.size
  end

end

class FlashCardGame
  attr_reader :decks

  def initialize(decks)
    @decks = decks
  end

  def play
    loop do
      chosen_deck = choose_deck
      if chosen_deck != nil
        chosen_deck.play
      else
        puts "Thank you, play again!"
        break
      end
    end
  end

  def choose_deck
    print "Please choose a deck (empty for none): "
    deck_name = gets.chomp

    decks.find do |deck|
      deck.name.downcase == deck_name.downcase
    end
  end

end

# spanish_english = []
# spanish_english << Card.new({ front: "gato", back: "cat" })
# spanish_english << Card.new({ front: "mono", back: "monkey" })
# spanish_english << Card.new({ front: "playa", back: "beach" })
# spanish_deck = Deck.new("Spanish", spanish_english)

# japanese_english = []
# japanese_english << Card.new({ front: "niko", back: "cat" })
# japanese_english << Card.new({ front: "inu", back: "dog" })
# japanese_english << Card.new({ front: "koi", back: "fish" })
# japanese_deck = Deck.new("Japanese", japanese_english)

class DeckReader
  def initialize(file_name) # file_name is decks.txt
    @file = File.new(file_name, "r") # creates variable @file to store new file object to read the decks.txt file
    @deck_count = @file.gets.to_i # 2 decks // reads first line in decks.txt file 
  end

  def decks # returns an array containing all decks in the decks.txt file
    @deck_count.times.map do # will return an array containing the block below // do loop iterates 2 times
      deck_name = file.gets.chomp # french // reads second line in decks.txt file **** spanish // reads eighth line in decks.txt file
      Deck.new(deck_name, get_cards) # creates a new Deck object passing deck_name variable and get_cards method as arguments
    end
  end

  private

  attr_reader :file

  def get_cards # reads decks.txt file to determine number of cards, stores front and back values and returns an array of card objects
    card_count = file.gets.to_i # reads third line of decks.txt and stores number of cards in card_count
    card_count.times.map do # creates an array of card objects containing the number of cards in card_count
      front = file.gets.chomp # stores value of front of first card // line four **** stores value of front of second card // line six
      back = file.gets.chomp # stores value of back of first card // line five **** stores value of back of second card // line seven
      Card.new({front: front, back: back}) # creates a new Card object contaning front and back values
    end 
  end
end

decks = DeckReader.new("decks.txt").decks # creates a new DeckReader object and passes decks.txt file as argument
game = FlashCardGame.new(decks)
game.play
