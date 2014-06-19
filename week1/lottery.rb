class Lottery
  def initialize
    @names = []
  end

  def play
    print_instructions
    get_names
    print_winner
  end

  private

  def print_instructions
    puts "Enter in a list of names followed by a blank line to start the lottery."
  end
  
  def get_names
    loop do
      print "> "
      name = gets.chomp # .chomp so the \n isn't pushed onto the array with user input
      if name == "" # used empty string not \n character, statement will never be true because .chomp shaves \n off user input
        break
      end
      @names.push(name) # -OR- name_list << name
    end
  end

  def print_winner
    puts "#{@names.shuffle.first} wins!" # -OR- name_list.sample returns random element of array
  end
end

lottery = Lottery.new
lottery.play