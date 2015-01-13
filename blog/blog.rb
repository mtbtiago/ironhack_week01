# This is very simple. Implement a Blog class where you can add 
# Post objects. Each post will have a title, a date and a text. 
# Then add a front_page method at Blog that returns the front 
# page of the blog in the following format:

class Blog
	def initialize
		@posts = []
	end
	def front_page
		@posts.reduce("") {|result,item|
		  result += 
		  "#{item.title}\n#{'*' * 20}\n#{item.text}\n#{'-' * 20}\n"
		}
	end
	def add_post(post)
		@posts << post
	end
end

class Post
	attr_reader :title, :date, :text
	def initialize (title, date, text)
		@title = title
		@data = date
		@text = text
	end
end

############ main
blog = Blog.new
blog.add_post(
	Post.new("my first post","01/01/2015","Lorem ipsum dolor sit amet"))
blog.add_post(
	Post.new("my second post","01/02/2015","En un lugar de La Mancha"))
blog.add_post(
	Post.new("Crazy one","01/02/2015","Sed ut perspiciatis unde omnis iste natus error"))
puts blog.front_page