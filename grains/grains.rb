# below is an implememtation which fails the tests
# but is a cleaner implementation of the Module

# A module to calculate number of grains
module Grains
  def square(position)
    unless positions.include?(position)
      raise ArgumentError,
            "\n#{position} is not a position given on the chess board.\n" +
            "Choose between numbers #{positions}."
    end
    2**(position - 1)
  end

  def total
    positions.map do |position|
      square(position)
    end.reduce(:+)
  end
end

# The Board Object
class Board
  include Grains
  attr_reader :positions
  def initialize(*dimensions)
    @dimensions = dimensions
    @size = dimensions.reduce(:*)
    @positions = (1..@size)
  end
end

module BookKeeping
  VERSION = 1
end

p Board.new(8, 8).square(5)
p Board.new(8, 8).total
p Board.new(8, 8).square(65)
