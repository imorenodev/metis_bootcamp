# hsh = {1 => "wombat", "chunky" => :bacon}
# print hsh.keys  #[1, "chunky"]
# print hsh.values  #["wombat", :bacon]

# hsh["foo"] = [1, 2, 3]
# hsh[[2, 3, 4]] = "quux"
# print hsh   # {1 => "wombat", "chunky" => :bacon, "foo" => [1, 2, 3], [2, 3, 4] => "quux"}



class Card
  attr_accessor :front

  def initialize(a_card) # passed hash {front: "gato", back: "cat"}
    @front = a_card[:front]
    @back = a_card[:back]
  end

  def play
    puts "Type the English word for the card shown."

    display_card
  end

  def display_card
    print "#{front}: "
  end

end

wombat = Card.new({front: "gato", back: "cat"}) # passing a hash to the initialize constructor
wombat.play
