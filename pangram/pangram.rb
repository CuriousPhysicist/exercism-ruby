# Required Class
class Pangram
  def self.pangram?(sentance)
    ('a'..'z').all? { |l| sentance.downcase.include?(l) }
  end
end

module BookKeeping
  VERSION = 5
end
