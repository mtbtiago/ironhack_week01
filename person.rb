class Person
	def initialize name, age
		@name = name
		@age = age
	end
	def getName
		@name
	end
	def setAge age
		@age = age
	end
	def getAge 
		@age
	end
	def birthday
		@age += 1
	end
	def celebritySetAge age
		if age < 10 || age > 90
			puts "error"
		end
		@age = age - 10
	end
end

p = Person.new "Pepe", 28
puts p.getName
puts p.getAge
p.setAge 29
puts p.getAge
p.birthday
puts p.getAge
p.celebritySetAge 990
p.getAge
