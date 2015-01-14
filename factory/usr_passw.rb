class Login
  USER = "pepe"
  PASS = "1234"
  TRYS = 3
  def execute
    i = 0
    while i < TRYS do
        puts "Please enter user name:"
        name = gets.chomp
        puts "Enter password:"
        passw = gets.chomp
        if name == USER && passw == PASS
        	return true
        end
        i += 1
      end
    end
  end

  if Login.new.execute
    puts "Let's go"
  else
    puts "No!"
  end
