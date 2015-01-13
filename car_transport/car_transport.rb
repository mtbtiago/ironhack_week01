class Car
	def initialize(sound, engine = NoEngine.new)
		@sound = sound
		@engine = engine
	end
	def <=>(other)
		@sound.length <=> other.sound.length
	end
	def sound
		@sound +" "+@engine.noise
	end
end

class CarTransport
	include Enumerable
	def initialize
		@cars = []
	end
	def << sound
		@cars << Car.new(sound)
	end
	def each(&block)
		@cars.each(&block)
	end
	def sort
		@cars.sort {|a,b| a.sound <=> b.sound }
	end
	def max
		@cars.max
	end
end

class Engine
	attr_reader :noise
	def initialize (noise)
		@noise = noise
	end
end

class NoEngine < Engine
	def initialize
		super("silence")
	end
end

############## main
# car_transport = CarTransport.new
# car_transport << "abcd"
# car_transport << "abc"
# car_transport << "ab"
# car_transport << "a"
# car_transport << "I'm the winner"

# puts car_transport.max.sound

ecoCar = Car.new("bip bip")
puts ecoCar.sound

gasCar = Car.new("go go",Engine.new("Brrom"))
puts gasCar.sound