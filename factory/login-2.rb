class UserFileStrategy
  def initialize
    @users = IO.readlines("users.txt")
  end
  def is_valid_login(user, password)
    @users.each do |line|
      current_user = line.split(" ")
      if current_user[0] == user && current_user[1] == password
        return true
        break
      end
    end
    false
  end
end

class HardCodedUsersStrategy
  USER = "Moritz"
  PASSW = "1234"
  def is_valid_login(user, password)
    user == USER && password == PASSW
  end
end

class Login
  def initialize(strategy)
    @strategy = strategy
  end
  def execute
    puts "Please enter Username"
    username = gets.chomp
    puts "Please enter Password"
    password = gets.chomp
    @strategy.is_valid_login(username,password)
  end
end

class Answer
  def check
    puts "Please give me some text"
    text = gets.chomp
    puts "What do you want to do?"
    puts "0. to end"
    puts "1. Count words"
    puts "2. count letters"
    puts "3. Reverse text"
    puts "4. Convert to uppercase"
    puts "5. Convert to lowercase"
    while true do
        option = gets.chomp
        case option
        when "0"
          break
        when "1"
          puts text.split(" ").length
        when "2"
          puts text.length
        when "3"
          puts text.reverse
        when "4"
          puts text.upcase
        when "5"
          puts text.downcase
        else
          puts "bad option"
        end
      end
    end
  end

  login = Login.new(UserFileStrategy.new)
  if login.execute
    Answer.new.check
  else
    puts "Answer is not recalled"
  end

  login = Login.new(HardCodedUsersStrategy.new)
  if login.execute
    Answer.new.check
  else
    puts "Answer is not recalled"
  end
