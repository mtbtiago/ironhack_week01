=begin
Time shifting
Sometimes the timing is shifted for a small amount, 2 or 3 seconds. Then comes the trouble when you need to shift everything a few seconds back or ahead.

You need to create a command line utility to help us to create a new subrip file that is shifted a random amount of milliseconds.

So, for example, if I want to shift everything 2500ms ahead, I would start with this:

01:32:04,283 --> 01:32:07,769
and end up with:

01:32:06,783 --> 01:32:10,269
=end
require 'date'
SEP = " --> "

class Time
	def to_s
		strftime("%H:%M:%S,%L")
	end
end

class SrtItem
private
  def str_to_time(str)
  	# input is "00:02:20,746"
  	parts = str.split(":")
 		result = Time.mktime(
 			0, # void year
 			1, # void month
 			1, # void day
 			parts[0],parts[1],parts[2].tr(",",".").to_f)
  end
public
	def initialize(id, from, to, text)
		@id = id
		@from = str_to_time(from)
		@to = str_to_time(to) 
		@text = text.reduce("") {|result,s| result += s+"\n"}
	end
	def shift(millisecs) # can be positive or negative
		@from = @from + (millisecs / 1000)
		@to = @to + (millisecs / 1000)
	end
	def to_s
		"#{@id}\n"+
		"#{@from.to_s} #{SEP} #{@to.to_s}\n"+
		"#{@text}\n"
	end	
end

class Main
private
	def fill_items
		file = IO.read(@file_name)
		# let's imagine input file is well formatted
		records = file.split("\n\n")
		records.each do |record|
			record_lines = record.split("\n")
			from_to = record_lines[1].split(SEP)
			item = 
				SrtItem.new(
					record_lines[0],
					from_to[0],
					from_to[1],
					record_lines[2..record_lines.size])
			item.shift(@shift)
			@items << item
		end
	end

public
	def initialize(file_name,shift)
		@file_name = file_name
		@shift = shift.to_i
		@items = []
	end
	def execute
		fill_items()
		@items.each do |item|
			puts item.to_s
		end
	end
end

########### main
Main.new(ARGV[0], ARGV[1]).execute
