class Login
  def initialize
    @user = "Moritz"
    @pass = "1234"
  end

  def execute
    puts "Please enter Username"
    @username = gets.chomp
    puts "Please enter Password"
    @password = gets.chomp
    @username == @user && @pass == @password
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

  login = Login.new
  if login.execute
    Answer.new.check
  else puts "Answer is not recalled"
  end
