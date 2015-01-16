require 'ap'

class MovementStrategyFactory
  def self.create_strategy(piece)
    case piece
    when "P"
      PawnMovementStrategy.new
    when "N"
      NkightMovementStrategy.new
    when "B"
      BishopMovementStrategy.new
    when "R"
      RookMovementStrategy.new
    when "Q"
      QueenMovementStrategy.new
    when "K"
      KingMovementStrategy.new
    else
      NoMovementStrategy.new
    end
  end
end

class PawnMovementStrategy
  def build_valid_targets(from_pos,direction = 1)
    result = []
    result << MoveCalculator.up_down_left_rigth(from_pos,direction,0)
    if (from_pos.y == 7 || from_pos.y == 2)
      result << MoveCalculator.up_down_left_rigth(from_pos,direction * 2,0)
    end
    result
  end
end

class NkightMovementStrategy
  def build_valid_targets(from_pos,direction = 0)
    result = ValidPositions.new
    result << MoveCalculator.up_down_left_rigth(from_pos,2,-1)
    result << MoveCalculator.up_down_left_rigth(from_pos,2,+1)
    result << MoveCalculator.up_down_left_rigth(from_pos,1,-2)
    result << MoveCalculator.up_down_left_rigth(from_pos,1,+2)
    result << MoveCalculator.up_down_left_rigth(from_pos,-2,-1)
    result << MoveCalculator.up_down_left_rigth(from_pos,-2,+1)
    result << MoveCalculator.up_down_left_rigth(from_pos,-1,-2)
    result << MoveCalculator.up_down_left_rigth(from_pos,-1,+2)
    result
  end
end

class BishopMovementStrategy
  def build_valid_targets(from_pos,direction = 0)
    result = ValidPositions.new
    x = from_pos.x
    y = from_pos.y
    while ('a'..'h').include?(x) && (1..8).include?(y)
      result << MoveCalculator.up_down_left_rigth(Position.new(x,y),-1,-1)
      x = MoveCalculator.add_chr(x,-1)
      y -= 1
    end
    while ('a'..'h').include?(x) && (1..8).include?(y)
      result << MoveCalculator.up_down_left_rigth(Position.new(x,y),+1,-1)
      x = MoveCalculator.add_chr(x,+1)
      y -= 1
    end
    while ('a'..'h').include?(x) && (1..8).include?(y)
      result << MoveCalculator.up_down_left_rigth(Position.new(x,y),-1,+1)
      x = MoveCalculator.add_chr(x,-1)
      y += 1
    end
    while ('a'..'h').include?(x) && (1..8).include?(y)
      result << MoveCalculator.up_down_left_rigth(Position.new(x,y),+1,+1)
      x = MoveCalculator.add_chr(x,+1)
      y += 1
    end
    result
  end
end

class RookMovementStrategy
  def build_valid_targets(from_pos,direction = 0)
    result = ValidPositions.new
    x = from_pos.x
    y = from_pos.y
    while ('a'..'h').include?(x) && (1..8).include?(y)
      result << MoveCalculator.up_down_left_rigth(Position.new(x,y),0,-1)
      x = MoveCalculator.add_chr(x,0)
      y -= 1
    end
    while ('a'..'h').include?(x) && (1..8).include?(y)
      result << MoveCalculator.up_down_left_rigth(Position.new(x,y),0,+1)
      x = MoveCalculator.add_chr(x,0)
      y += 1
    end
    while ('a'..'h').include?(x) && (1..8).include?(y)
      result << MoveCalculator.up_down_left_rigth(Position.new(x,y),+1,0)
      x = MoveCalculator.add_chr(x,+1)
      y += 0
    end
    while ('a'..'h').include?(x) && (1..8).include?(y)
      result << MoveCalculator.up_down_left_rigth(Position.new(x,y),-1,0)
      x = MoveCalculator.add_chr(x,-1)
      y += 0
    end
    result
  end
end

class QueenMovementStrategy
  def build_valid_targets(from_pos,direction = 0)
    result = ValidPositions.new
    x = from_pos.x
    y = from_pos.y
    while ('a'..'h').include?(x) && (1..8).include?(y)
      result << MoveCalculator.up_down_left_rigth(Position.new(x,y),-1,-1)
      x = MoveCalculator.add_chr(x,-1)
      y -= 1
    end
    while ('a'..'h').include?(x) && (1..8).include?(y)
      result << MoveCalculator.up_down_left_rigth(Position.new(x,y),+1,-1)
      x = MoveCalculator.add_chr(x,+1)
      y -= 1
    end
    while ('a'..'h').include?(x) && (1..8).include?(y)
      result << MoveCalculator.up_down_left_rigth(Position.new(x,y),-1,+1)
      x = MoveCalculator.add_chr(x,-1)
      y += 1
    end
    while ('a'..'h').include?(x) && (1..8).include?(y)
      result << MoveCalculator.up_down_left_rigth(Position.new(x,y),+1,+1)
      x = MoveCalculator.add_chr(x,+1)
      y += 1
    end
    x = from_pos.x
    y = from_pos.y
    while ('a'..'h').include?(x) && (1..8).include?(y)
      result << MoveCalculator.up_down_left_rigth(Position.new(x,y),0,-1)
      x = MoveCalculator.add_chr(x,0)
      y -= 1
    end
    while ('a'..'h').include?(x) && (1..8).include?(y)
      result << MoveCalculator.up_down_left_rigth(Position.new(x,y),0,+1)
      x = MoveCalculator.add_chr(x,0)
      y += 1
    end
    while ('a'..'h').include?(x) && (1..8).include?(y)
      result << MoveCalculator.up_down_left_rigth(Position.new(x,y),+1,0)
      x = MoveCalculator.add_chr(x,+1)
      y += 0
    end
    while ('a'..'h').include?(x) && (1..8).include?(y)
      result << MoveCalculator.up_down_left_rigth(Position.new(x,y),-1,0)
      x = MoveCalculator.add_chr(x,-1)
      y += 0
    end
    result
  end
end

class KingMovementStrategy
  def build_valid_targets(from_pos,direction = 0)
    result = ValidPositions.new
    x = from_pos.x
    y = from_pos.y
    result << MoveCalculator.up_down_left_rigth(Position.new(x,y),0,-1)
    result << MoveCalculator.up_down_left_rigth(Position.new(x,y),0,+1)
    result << MoveCalculator.up_down_left_rigth(Position.new(x,y),+1,0)
    result << MoveCalculator.up_down_left_rigth(Position.new(x,y),-1,0)
    result
  end
end

class NoMovementStrategy
  def build_valid_targets(from_pos,direction = 0)
    ValidPositions.new
  end
end

class ValidPositions < Array
  def << (position)
    if ('a'..'h').include?(position.x) and (1..8).include?(position.y)
      super
    end
  end
end

#################
class MoveCalculator
  #################
  def self.direction(color)
    (color == "b") ? -1 : +1
  end
  def self.up_down_left_rigth(from_pos,steps_vert,steps_hort)
    Position.new(add_chr(from_pos.x,steps_hort),from_pos.y+steps_vert)
  end
  def self.add_chr(chr,steps)
    (chr.ord + steps).chr
  end
end

#################
class Position
  #################
  attr_reader :x, :y
  def initialize(x,y)
    @x = x
    @y = y
  end
  def == (other_position)
    @x == other_position.x && @y == other_position.y
  end
end

#################
class Validator
  #################
  def initialize(board,moves)
    @board = board
    @moves = moves
  end
  def validate
    @moves.each do |move|
      puts (move.validate ? "LEGAL" : "ILLEGAL")
    end
  end
end

#################
class Piece
  #################
  attr_reader :position, :color, :strategy
  def initialize(color, strategy, position)
    @color = color
    @strategy = strategy
    @position = position
  end
  def validate(to_pos)
    valid_targets = @strategy.build_valid_targets(@position,MoveCalculator.direction(@color))
    valid_targets != nil && valid_targets.find_index {|pos| pos == to_pos} != nil
  end
end

#################
class Move
  #################
  def initialize(board, from_pos, to_pos)
    @board = board
    @from_pos = from_pos
    @to_pos = to_pos
  end
  def validate
    piece = @board.piece_at(@from_pos)
    result = piece.validate(@to_pos)
    if result
      target_piece = @board.piece_at(@to_pos)
      result = target_piece.color != piece.color
    end
    result
  end
end

#################
class Board
  #################
  def initialize
    @pieces = []
    @moves = []
  end

  def validate(board_file_name,moves_file_name)
    @board_file_name = board_file_name
    @moves_file_name = moves_file_name
    load_board()
    # ap @pieces
    load_moves()
    # ap @moves
    Validator.new(@board,@moves).validate
  end

  def piece_at(position)
    idx = @pieces.find_index {|piece|
    piece.position == position }
    if idx == nil
      Piece.new("-",MovementStrategyFactory.create_strategy("void"),Position.new("a",8))
    else
      @pieces[idx]
    end
  end

  private
  def raise_invalid_file(msg)
    # ToDo: raise an actual error
    puts ("Invalid file #{@board_file_name}. #{msg}")
  end

  def do_a_line(line,y)
    # bR bN bB bQ bK bB bN bR
    # bP bP bP bP bP bP bP bP
    # -- -- -- -- -- -- -- --
    pieces = line.split(" ")
    x = "a"
    pieces.each do |piece|
      if x > "h"
        raise_invalid_file("Must have 8 columns")
      end
      color = piece[0]
      kind = piece[1]
      new_piece = Piece.new(
        color,
        MovementStrategyFactory.create_strategy(kind),
      Position.new(x,y))
      @pieces << new_piece
      x = MoveCalculator.add_chr(x,1)
    end
  end

  def load_board()
    # bR bN bB bQ bK bB bN bR
    # bP bP bP bP bP bP bP bP
    # -- -- -- -- -- -- -- --
    # -- -- -- -- -- -- -- --
    # -- -- -- -- -- -- -- --
    # -- -- -- -- -- -- -- --
    # wP wP wP wP wP wP wP wP
    # wR wN wB wQ wK wB wN wR
    lines = IO.readlines(@board_file_name)
    if lines.length != 8
      raise_invalid_file("Must have 8 lines")
    end
    y = 8
    lines.each do
      |line| do_a_line(line,y)
      y -= 1
    end
  end

  def load_moves()
    # a2 a3
    # a2 a4
    # a2 a5
    # a7 a6
    lines = IO.readlines(@moves_file_name)
    lines.each do |line|
      from_to = line.split(" ")
      new_move = Move.new(
        self,
        Position.new(from_to[0][0],from_to[0][1].to_i),
      Position.new(from_to[1][0],from_to[1][1].to_i))
      @moves << new_move
    end
  end
end

####### main
Board.new.validate(ARGV[0],ARGV[1])
