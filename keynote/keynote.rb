require 'terminfo'
require_relative 'text_rectangle.rb'

class Notes
  include Enumerable
  def initialize
    lines = IO.read("keynote.txt")
    @notes = lines.split("---\n")
  end
  def [](idx)
    @notes[idx]
  end
  def length
    @notes.length
  end
end

class KeyNote
  NEXT = "(N)ext"
  PREV = "(P)revious"

  private
  def show_the_end
    @text_rectangle.show_the_end
  end

  def wait_for_key
  	result = false
    if @auto_mode
      sleep(0.3)
      @idx += 1
      if @auto_mode and @idx >= @notes.length
      	result = true
      end
    else
      begin
        key = STDIN.getc.downcase
      end until ['n','p','q'].include?(key)
      case key
      when "n"
        @idx += 1
      when "p"
        @idx -= 1
      when "q"
        result = true
      end
    end
    result
  end

  def show_note
    if @idx < 0
      @idx = 0
    elsif @idx >= @notes.length
      @idx = @notes.length - 1
    end

    @text_rectangle.draw_center_text(2,@notes[@idx])

    case
    when @idx == 0
      print NEXT
    when @idx == @notes.length - 1
      print PREV
    else
      print "#{PREV} #{NEXT}"
    end
    puts " (Q)uit"
  end

  public
  def initialize(*args)
    @notes = Notes.new
    @idx = 0
    @auto_mode = (args.length > 0 && args[0].to_s.downcase == "auto")
    @text_rectangle = TextRectangle.new
  end

  def run
    while true
      show_note()
      if wait_for_key()
      	show_the_end()
      	break
      end
    end
  end
end

#### main
puts KeyNote.new(ARGV[0]).run
