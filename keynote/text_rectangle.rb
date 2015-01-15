require 'terminfo'
require 'awesome_print'

class TextRectangle
private
  def fixed_str_center (text,len)
    l = len - text.length
    if l < 0
      l = text.length
    end
    " " * (l / 2)+text.slice(0,l) +" " * (l / 2)
  end

  def middle_line(len,text = "")
    if text.empty?
      " " * len
    else
      fixed_str_center(text,len).ljust(len," ")
    end
  end

public
  def initialize
    @h = TermInfo.screen_size[0]
    @w = TermInfo.screen_size[1]
  end

  def draw_rectangle (offset, text)
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
    center_h = @h / 2
    i = offset
    while i < vert
      show_text = (i == center_h) ? text : ""
      puts (
        (" " * (offset + 1)) +
        "*" +
        middle_line(hort_line.length - offset - 2,show_text)+
      "*")
      i += 1
    end
    puts(hort_line)
  end

  def draw_center_text(offset,text)
    system ("clear")
    lines = text.split("\n")

    first_offset = offset + (lines.length * 2)
    i = 0
    while i < first_offset
      puts
      i +=1
    end
    vert = @h - first_offset - 1
    center_h = @h / 2
    i = first_offset
    j = 0
    while i < vert
      if (i >= first_offset && j < lines.length)
        show_text = lines[j]
        j += 1
      else
        show_text = ""
      end
      puts fixed_str_center(show_text,@w)
      i += 1
    end
  end

  def show_the_end
    i = 1
    until i > @h / 2
      draw_rectangle(i,"THE  END")
      i += 2
      sleep(0.3)
    end
  end
end
