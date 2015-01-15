puts "Welcome to Ultimate Pry!"
puts "Please, type \"exit\" to quit"
while true do 
	sentence = gets.chomp
	if sentence == "exit" 
		break
	end
	puts eval sentence
end
