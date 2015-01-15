class Object
  def salute
    puts "Hello, I'm "+self.class.to_s
  end
end
a= Object.new
a.salute

# this will crash pry
# class Fixnum
# 	def +(a)
# 		rand * a
# 	end
# end

class Dummy
  def method_missing (m, *args, &block)
    puts "There's no method called #{m} here -- please try again"
    puts "You passed this parameter list:"
    args.each {|param| puts param}
  end
end

class PatchedHash
	attr_reader :my_hash
  def initialize
    @my_hash = {}
  end
  def method_missing (m, *args, &block)
    if args.length == 0
      @my_hash[m]
    else
      @my_hash[m] = args[0]
    end
  end
end