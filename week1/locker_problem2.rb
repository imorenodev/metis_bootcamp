class Locker_problem
  def initialize
    @lockers = Array.new(101, false) # lockers = [false] * 101 // lockers = 100.times.map { false } // we set 101 to avoid the 0 index and still get 100 lockers
  end

  def solve
    1.upto(100) do |locker_index|
      1.upto(100) do |student_index|
        if locker_index % student_index == 0
          @lockers[locker_index] = !@lockers[locker_index]
        end
      end
    end
    print_lockers
  end

  def print_lockers
    1.upto(100) do |locker_index|
      puts "#{locker_index}. #{@lockers[locker_index]}"
    end
  end
end

Locker_problem.new.solve