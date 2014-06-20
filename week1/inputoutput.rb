file = File.new("hello.txt", "r") # "hello.txt" is the file "r" is for *read*
puts file.gets # takes one line at a time
puts file.gets 

item_1 = file.gets.to_i # takes 1 and stores it as int value in item_1
item_2 = file.gets.to_i # takes 2 and stores it as int value in item_2
item_3 = file.gets.to_i

puts file.readlines # prints out an array of every line in the file ["1\n", "2\n", "3\n"]

####################### Writing to File

file = File.new("hello.txt", "w") # "w" means write to file
file.puts("Hello!") # overwrites everything in file with "Hello!" // destructive operation

####################### Appending to File

file = File.new("hello.txt", "a") # "a" appends to file
file.puts("Hey There!") # adds "Hey There!" to end of the file without destroying previous contents of file


file = File.new("hello.txt", "a+") # "a+" allows to append and read the file at once

