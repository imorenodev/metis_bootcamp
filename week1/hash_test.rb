names = ["anna", :anna, "fred"] 
animals = { "fred" => "wombat", "anna" => "porcupine" }

names.each_with_index do |name, index|
  puts animals[name].inspect # inspect identifies what is literally being associated with the hash[name] e.g. "porcupine" "wombat" nil
  if index % 2 == 0
    puts name
  end
end