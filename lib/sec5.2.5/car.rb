class Car
  attr_reader :make

  # Class instance variables like @total_count only available to class methods
  # Class instance variables lost in inheritance chain
  def self.total_count
    @total_count ||= 0
  end
  def self.total_count=(n)
    @total_count = n
  end
  def self.makes
    @makes ||= []
  end
  def self.cars
    @cars ||= {}
  end
  def self.add_make(make)
    unless makes.include?(make)
      makes << make
      cars[make] = 0
    end
  end

  def initialize(make)
    if self.class.makes.include?(make)
      puts "Creating a new #{make}!"
      @make = make
      self.class.cars[make] += 1
      self.class.total_count += 1
    else
      raise "No such make: #{make}."
    end
  end
  def make_mates
    self.class.cars[self.make]
  end
end

Car.add_make("Honda")
Car.add_make("Ford")
h = Car.new("Honda")
f = Car.new("Ford")
h2 = Car.new("Honda")

puts "Counting cars of same make as f..."
puts "There are #{f.make_mates}."
puts "Counting cars of same make as h..."
puts "There are #{h.make_mates}."
puts "Counting cars of same make as h2..."
puts "There are #{h2.make_mates}."

puts "Counting total cars..."
puts "There are #{Car.total_count}."

puts Car.makes
puts Car.cars
