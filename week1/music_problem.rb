require 'csv'

class Discography
  def initialize(file)
    @music = file
  end

  def play
    welcome # prints welcome message
    loop do # enter infinite loop to keep asking user for artist names
      get_artist # get artist name from user
      if @artist != ""  # check for program termination
        find_songs # search music database and create a hash containing songs by artist that are referenced by artist's name as the key
        print_songs # find hash key with artist name and print corresponding array of the artists songs (being pointed to by the key)
      else
        break
      end
    end
  end

  def get_artist
    print "\n Query: "
    @artist = gets.chomp
  end

  def find_songs
    @db = {} # creates hash db
    counter = 0 # counter variable to make sure we skip the first line/header line of the music.csv file
    CSV.foreach(@music) do |row| # calls the .foreach method, with @music ("music.csv") as the argument, on the CSV class to return an array one row at a time
      if counter > 0 # skip first row / header row of the music.csv file
        artist = row[3] # store the artist name from row[collumn 4]
        song = row[0] # store the song name from row[collumn 1]
        if !@db[artist] # if the hash key doesn't point to any value (if it doesn't exist)
          @db[artist] = [song] # initializes db hash key [artist] and assigns it to new array containing value [song]
        else
          @db[artist] << song # appends song to the array that is being referenced by the hash key [artist] in db hash
        end
      end
      counter += 1
    end
  end

  def print_songs
    header
    @db[@artist].each do |song|
      puts song
    end
  end

  def header
    print "\n" + "*" * (@artist.length + 13)
    print "\n" + "* Songs by #{@artist} *\n"
    print "*" * (@artist.length + 13) + "\n"
  end

  def welcome
    puts "Enter an artist's name to look up their discography."
  end
end

find_music = Discography.new("music.csv") # creates new object find_music of the Discography class and passes "music.csv" as argument to initialize
find_music.play # calls .play method on find_music object

# CSV.foreach("music.csv") do |row|
#   puts row
# end