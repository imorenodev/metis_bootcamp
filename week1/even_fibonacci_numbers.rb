class EvenFibSum
  attr_accessor :n1, :n2, :n3

  def initialize
    @n1 = 0
    @n2 = 1
    @n3 = 1
    @sum = 0
  end

  def play
    while (n3 < 4000000)
      if n3 % 2 == 0
        @sum += n3
      end

      @n3 = n1 + n2
      @n1 = n2
      @n2 = n3
    end

    puts @sum
  end
end

EvenFibSum.new.play