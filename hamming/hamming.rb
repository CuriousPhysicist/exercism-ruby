# Calculates the Hamming distance between two strands of DNA
class Hamming
  def self.compute(strand1, strand2)
    unless strand1.length == strand2.length
      raise ArgumentError,
            'Strands must be of equal length to give a Hamming distance.'
    end
    (0...strand1.length).count { |i| strand1[i] != strand2[i] }
  end
end

module BookKeeping
  VERSION = 3
end
