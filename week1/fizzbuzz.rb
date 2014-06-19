class Fizzbuzz
  attr_reader :count_to

  def initialize(count_to)
    @count_to = count_to
  end

  def play
    (1..count_to).each do |count|
      if count % 3 == 0 && count % 5 == 0
        puts "FizzBuzz"
      elsif count % 3 == 0
        puts "Fizz"
      elsif count % 5 == 0
        puts "Buzz"
      else
        puts count
      end
    end
  end
end

fizz_buzz = Fizzbuzz.new(100)
fizz_buzz.play

1.upto(100) do |number|
  if number % 15 == 0
    puts "FizzBuzz"
  elsif number % 3 == 0
    puts "Fizz"
  elsif number % 5 == 0
    puts "Buzz"
  end
end