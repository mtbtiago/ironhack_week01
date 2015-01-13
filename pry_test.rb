class A
	def my_method
		binding.pry
		puts "hi"
	end
end

a = A.new
a.my_method