class OldestYoungest
  def initialize
    @people_list = {}
  end

  def play
    get_list
    print_oldest
    print_youngest
  end

  def get_list
    puts "Enter people's names and ages followed by an empty line:"
    loop do
      print ">"
      person = gets

      if person == "\n"
        break
      else
        name, age = person.split(" ")
        @people_list[name] = age.to_i
      end
    end
  end

  def print_oldest
    @oldest = 0
    @people_list.each do |key, value|
      if @oldest < value
        @oldest = value
        @temp_oldest = key
      end
    end
    puts "#{@temp_oldest} is the oldest."
  end

  def print_youngest
    @youngest = @oldest
    @people_list.each do |key, value|
      if @youngest > value
        @youngest = value
        @temp_youngest = key
      end
    end
    puts "#{@temp_youngest} is the youngest."
  end
end

OldestYoungest.new.play