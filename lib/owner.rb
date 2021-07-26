class Owner

  attr_accessor
  attr_reader :name, :species

  @@all_owners = []

  def initialize(name, species = "human")
    @name = name
    @species = species
    @@all_owners << self

  end

  def self.all
    return @@all_owners
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    self.all.clear
  end

  def say_species
    return "I am a #{@species}."
  end

  def cats
    my_cats = []
    Cat.all.each do |c|
      if c.owner == self
        then my_cats << c
      end
    end

    return my_cats
    
  end

  def dogs
    my_dogs = []
    Dog.all.each do |d|
      if d.owner == self
        then my_dogs << d
      end
    end

    return my_dogs
    
  end

  def buy_cat(name)
    new_cat = Cat.new(name, self)
  end

  def buy_dog(name)
    new_dog = Dog.new(name, self)
  end

  def walk_dogs
    dogs.each do |d|
      d.mood = "happy"
    end
  end

  def feed_cats
    cats.each do |c|
      c.mood = "happy"
    end
  end

  def sell_pets
    cats.each do |c|
      c.mood = "nervous"
      c.owner = nil
    end
    dogs.each do |d|
      d.mood = "nervous"
      d.owner = nil
    end
  end

  def list_pets
    return "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end

    





end