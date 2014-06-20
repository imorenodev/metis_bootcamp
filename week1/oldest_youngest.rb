class OldestYoungest
  def initialize
    @people_list = Array.new
  end

  def play
    get_list
    print_oldest
    print_youngest
  end

  def get_list
    puts "Enter people's names and ages followed by an empty line:"

    while get_person
      get_person
    end
  end

  def get_person # get list of people
    print ">"
    person = gets

    if person == "\n"
      false
    else
      name, age = person.split(" ")
      @people_list[name] = age.to_i
    end
  end

  def print_oldest

  end

  def print_youngest
    # print the youngest person in the series
  end

  def older?(person)
    # returns true if person is older
  end

  def younger?(person)
    # returns true if person is younger
  end
end

OldestYoungest.new.play