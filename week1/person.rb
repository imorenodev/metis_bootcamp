class Person
  def initialize(name, age) #instance method
    @name = name
    @age = age
  end

  def hello
    puts "Hello my name is " + @name + " and I am " + @age.to_s + " years old."
  end

  def self.john_doe #class method
    new("John Doe", 10) # same as writing Person.new("John Doe", 10)
  end

  def self.jane_doe #class method
    new("Jane Doe", 10) # same as writing Person.new("Jane Doe", 10)
  end
end

person = Person.john_doe
person.hello

person2 = Person.new("Ian", 27)
person2.hello