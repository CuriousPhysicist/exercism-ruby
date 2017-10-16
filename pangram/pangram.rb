# Monkey Patch Enumerable
module Enumerable
  def contains_the_alphabet?
    alphabet = [*'a'..'z']
    (alphabet - [*self].flatten).empty?
  end
end

# Required Class
class Pangram
  def self.pangram?(sentence)
    sentence.downcase.chars.contains_the_alphabet?
  end
end

module BookKeeping
  VERSION = 5
end

# Test class  for testing generality of the Enumerable monkey patch
class MyCollection
  include(Enumerable)
  attr_reader :arguments
  def initialize(*args)
    @arguments = args
    @counter = 0
  end

  def each(&block)
    while @counter < arguments.length
      @counter < arguments.length ? @counter += 1 : @counter = 0
      if block
        yield arguments[@counter - 1]
      else
        arguments[@counter - 1]
      end
    end
  end
end

# Test Suite
puts 'MyCollection numerical'
p MyCollection.new(1, 2, 3, 4, 5).arguments
puts 'test #each behaviour with Block using puts element'
MyCollection.new(1, 2, 3, 4, 5).each { |c| puts c }
puts 'test #each behaviour with Block using puts element^2'
MyCollection.new(1, 2, 3, 4, 5).each { |c| puts c * 2 }
puts 'applying the alphabet test, expect false'
p MyCollection.new(1, 2, 3, 4, 5).contains_the_alphabet?

puts "\nMyCollection Letters"
p MyCollection.new('a', 'b', 'c', 'd', 'e').arguments
puts 'applying the alphabet test, expect false'
p MyCollection.new('a', 'b', 'c', 'd', 'e').contains_the_alphabet?

puts "\nTesting #contains_the_alphabet? with an Array"
p [*'a'..'z']
p [*'a'..'z'].contains_the_alphabet?
puts 'Testing #contains_the_alphabet? with an Array mutating each element'
temp = (('a'..'z').map { |element| element + 'x' })
p temp
p temp.contains_the_alphabet?

puts "\nTesting #contains_the_alphabet? with a Range"
temp = ('a'..'z')
p temp
p temp.contains_the_alphabet?

puts "\nTesting #contains_the_alphabet? with a Hash"
p temp2 = [*1..26].zip([*'a'..'z']).to_h
p temp2.contains_the_alphabet?
p temp2 = [*'a'..'z'].zip([*1..26]).to_h
p temp2.contains_the_alphabet?

puts "\nTesting #contains_the_alphabet? with MyCollection"
p temp = MyCollection.new(*'a'..'z')
p temp.contains_the_alphabet?
