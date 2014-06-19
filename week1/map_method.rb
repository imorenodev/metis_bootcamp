# class Map_method
#   def map
#     index = 0
#     new_array = []

#     while index < length
#       new_array[index] << self[index] * 3
#       index += 1
#     end  
#     yield new_array
#   end

#  i = [1, 2, 3].map do |elements|
#     puts i * 3
#   end

# end


# class Array
#   def map
#     index = 0
#     mapped_array = [] # new array to be returned

#     while index < length
#       element = self[index] # variable element is equal to the value of array i[index] // 1 // 2 // 3
#       value = yield(element) # pass element to the block through yield // element is multiplied by 3 and returned and stored in value
#       mapped_array << value # value is pushed into the mapped_array
#       index += 1
#     end
#     mapped_array # return the new array with each element multiplied by 3
#   end
# end

# i = [1, 2, 3].map do |elements| # create new array called i, multiply all contents by 3 and return new array
#   elements * 3
# end

# puts i == [3, 6, 9]


class Array
  def map
    mapped_array = []

    each do |element|
    mapped_array << yield(element)
    end
    mapped_array
  end
end

i = [1, 2, 3].map do |elements| # create new array called i, multiply all contents by 3 and return new array
  elements * 3
end

puts i == [3, 6, 8]
