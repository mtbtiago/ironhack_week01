require 'terminfo'
require 'awesome_print'

class TheEnd
  def initialize
    @h = TermInfo.screen_size[0]
    @w = TermInfo.screen_size[1]
  end

  def fixed_str_center (text,len)
    l = len - text.length
    if l < 0
      l = 0
    else
      l /= 2
    end
    " " * (l)+text+" " * (l)
  end

  def middle_line(len,text = "")
    if text.empty?
      " " * len
    else
      fixed_str_center(text,len)
    end

  end

  def draw_rectangle (offset)
    system ("clear")
    i = 0
    while i < offset
      puts
      i +=1
    end
    vert = @h - offset - 1
    hort = @w - offset - 1
    hort_line =
      (" " * ((offset + 1) + 1) )+
      ("*" * (hort - (offset*2) - 2))
    puts hort_line
    text = ((vert - offset) < 3) ? "THE END" : ""
    i = offset
    while i < vert
      puts (
        (" " * (offset + 1)) +
        "*" +
        middle_line(hort_line.length - offset - 2,text)+
      "*")
      i += 1
    end
    puts(hort_line)
    # gets
  end

  def run
    i = 1
    until i > @h / 2
      draw_rectangle(i)
      i += 2
      sleep(0.3)
    end
  end
end
### main
TheEnd.new.run
