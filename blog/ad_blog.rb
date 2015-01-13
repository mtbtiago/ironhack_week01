# This is very simple. Implement a Blog class where you can add 
# Post objects. Each post will have a title, a date and a text. 
# Then add a front_page method at Blog that returns the front 
# page of the blog in the following format:
require 'date'

class Blog
	include Enumerable
	def initialize
		@posts = []
	end
	private
		def advertise(post)
			if post.is_sponsored
				return '*'*5+post.title+'*'*5
			else
				return post.title
			end
		end

	public
	def front_page
		@posts.sort!
		@posts.reduce("") do |result,item|
		  result += 
		  "#{item.date.day}/#{item.date.month}/#{item.date.year}\n"+
		  "#{advertise(item)}\n#{'*' * 20}\n#{item.text}\n#{'-' * 20}\n"
		end
	end

	def add_post(post)
		@posts << post
	end
end

class Post
	attr_reader :title, :date, :text, :is_sponsored
	def initialize (title, date, text, is_sponsored = false)
		@title = title
		@date = date
		@text = text
		@is_sponsored = is_sponsored
	end
	def <=> (other)
		@date <=> other.date
	end
end

############ main
blog = Blog.new
blog.add_post(
	Post.new("my first post",Date.new(2015,02,01),"Lorem ipsum dolor sit amet"))
blog.add_post(
	Post.new("my second post",Date.new(2015,03,31),"En un lugar de La Mancha",true))
blog.add_post(
	Post.new("Crazy one",Date.new(2014,12,31),"Sed ut perspiciatis unde omnis iste natus error"))
puts blog.front_page