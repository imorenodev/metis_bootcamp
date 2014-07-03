class MusicalChairs
  def initialize
    @input = File.new("chairs.in.txt", "r")
    @output = File.new("chairs.out.txt", "w")
  end

  def play
    read_file
    #write_file
  end

  def read_file
    round = 0
    @input.readlines.each do |line|
      new_line = line.split(" ")
      child_num = new_line[0].to_i
      chair_num = new_line[1].to_i
      round += 1
      write_file(child_num, chair_num, round)
    end
  end

  def write_file(child_num, chair_num, round)
    losers = child_num - chair_num
    puts losers
    @output.puts("Round \##{round}: #{} children eliminated.")
  end
end

MusicalChairs.new.play