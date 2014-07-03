class Multiples
  attr_reader :number

  def initialize(number)
    @number = number
    @sum = 0
  end

  def play
    find_multiples_3
    find_multiples_5
    print_results
  end

  def find_multiples_3
    1.upto(number-1) do |i|
      if i % 3 == 0
        @sum += i
        puts i
      end
    end
  end

  def find_multiples_5
    1.upto(number-1) do |i|
      if i % 5 == 0 && i % 3 != 0
        @sum += i
        puts i
      end
    end
  end

  def print_results
    puts "The sum of all the multiples of 3 or 5 below #{number} is: #{@sum}."
  end
end

Multiples.new(1000).play