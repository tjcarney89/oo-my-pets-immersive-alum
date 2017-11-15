class Owner
  attr_accessor :pets, :name
  attr_reader :species

  @@all = []

  def initialize(species)
    @species = species
    @pets = {fishes: [], dogs: [], cats: []}
    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    @@all.size
  end

  def self.reset_all
    @@all.clear
  end

  def say_species
     "I am a #{species}."
  end

  def buy_cat(name)
    cat = Cat.new(name)
    @pets[:cats] << cat
  end

  def buy_dog(name)
    dog = Dog.new(name)
    @pets[:dogs] << dog
  end

  def buy_fish(name)
    fish = Fish.new(name)
    @pets[:fishes] << fish
  end

  def walk_dogs
    dogs = @pets[:dogs]
    dogs.each do |dog|
      dog.mood = "happy"
    end
  end

  def play_with_cats
    cats = @pets[:cats]
    cats.each do |cat|
      cat.mood = "happy"
    end
  end

  def feed_fish
    fishes = @pets[:fishes]
    fishes.each do |fish|
      fish.mood = "happy"
    end
  end

  def sell_pets
    @pets.each do |species, animal_hash|
      animal_hash.each do |pet|
        pet.mood = "nervous"
      end
    end
    @pets.clear
  end

  def list_pets
    response = "I have "
    @pets.each do |species, animal_array|
      num = animal_array.size
      if species == :fishes
        response += "#{num} fish, "
      elsif species == :dogs
        response += "#{num} dog(s), and "
      elsif species == :cats
        response += "#{num} cat(s)."
      end
    end
    response
  end





end
