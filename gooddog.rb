# frozen_string_literal: true

# Its a module!
module Swimmable
  def swim
    "#{respond_to?(:name) ? name : self.class} is swimming!"
  end
end

# Its a class!
class Animal
  def speak
    "#{name} says #{sound}!"
  end
end

class Mammal < Animal
end

class Fish < Animal
  include Swimmable
end


class GoodDog < Mammal
  DOGYEARS = 7
  @@number_of_dogs = 0
  attr_accessor :name, :age, :weight, :height, :sound

  def initialize(name, age, weight, height)
    @@number_of_dogs += 1
    @name = name
    @age = age * DOGYEARS
    @weight = weight
    @height = height
    @sound = 'Arf!'
  end

  def to_s
    "This dog's name is #{name} and it is #{age} in dog years."
  end

  def self.what_am_i
    "I'm a GoodDog class!"
  end

  def self.total_number_of_dogs
    @@number_of_dogs
  end
  include Swimmable
end

class Cat < Animal
  attr_accessor :sound, :name

  def initialize(name = 'Lucy')
    @name = name
    @sound = 'Meow!'
  end
end

puts GoodDog.what_am_i
puts GoodDog.total_number_of_dogs
Mark = GoodDog.new('Mark', 5, 100, 5)
Lucy = Cat.new
puts GoodDog.total_number_of_dogs
puts Mark
puts Mark.speak
puts Lucy.speak
puts Mark.swim
John = Fish.new
puts John.swim
