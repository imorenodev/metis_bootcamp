require 'csv'

class CSVTest
  attr_accessor :music, :db

  def initialize(file)
    @music = file
    @db = {}
  end

  def play
    builder
    print_db
  end

  def builder
    counter = 0 # counter to make sure we skip the first/header row
    CSV.foreach(@music) do |row| # calls .foreach method on class CSV and passes music variable containing path to "music.csv"
      if counter > 0 # to skip the first row[0] which is the header row
        artist = row[3] # store the artist name in artist variable
        song = row[0] # store song name in song variable
        album = row[5]
        if !db[artist] # check to make sure if new key or not
          db[artist] = [song] # if new key (new artist name) then create a new hash key with [artist] that points to a new array containing song as the first argument
        else # if the hash [artist] already exists 
          db[artist] << [song, album] # append song and album to the array that is being pointed to by the hash key [artist]
        end
      end
      counter += 1
    end
  end

  def print_db
    artist = "Taylor Swift"
    db[artist].each do |song, album|
      puts "Song: #{song} - Album: #{album}"
    end
  end
end

music_db = CSVTest.new("music.csv")
music_db.play