# A module to calculate number of grains
module Grains
  BOARD = (1..64)
  def self.square(position)
    unless BOARD.member?(position)
      raise ArgumentError,
            "#{position} is not a position given on the chess board."
    end
    2**(position - 1)
  end

  def self.total
    BOARD.map do |position|
      square(position)
    end.reduce(:+)
  end
end

module BookKeeping
  VERSION = 1
end
