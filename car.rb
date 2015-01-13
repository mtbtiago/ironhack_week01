require 'pry'

class Car
	def initialize(noise)
		@noise = noise
		new_number = Car.number_of_cars + 1
		IO.write("cars.txt", new_number)
	end
	def make_noise
	  @noise
	end
	def self.number_of_cars
	  IO.read("cars.txt").to_i
	end
end

class RacingCar < Car
	def initialize
		super "Brrrrooom"
	end
end

# car = Car.new "brom"
# puts car.make_noise
# moreNoiseCar = Car.new "brooom"
# puts moreNoiseCar.make_noise
# ferrari = RacingCar.new 
# puts ferrari.make_noise

# puts Car.number_of_cars
# puts IO.read("cars.txt").to_i 

# [Car.new("oh!"),Car.new("ouch!"),Car.new("beep")].
#   each do |car| p car.make_noise
# end

binding.pry

cars = []
sounds = ["Broom","Meek","Nyan"]
sounds.each do |sound| 
  cars << Car.new(sound)
end

# cars = sounds.map{|sound| Car.new(sound)}
# puts cars
# puts cars[2].make_noise

# dict = {}
# [["a",1],["b",2],["c",3]].each do |sound|
#  key = item[0].to_sym
#  dict[key] = item[1]
# end
# puts dict

# dict = [["a",1],["b",2],["c",3]].each_with_object({}) do |item, memo|
#  memo[item[0].to_sym] = item[1]
# end

# dict = sounds.each_with_object({}) do |sound, memo|
# 	memo[sound[0].to_sym] = sound[1]
# end
# puts dict

# puts cars
names = cars.reduce("the names are: "){ |names,car| names + car.make_noise+" " }
puts names
