# Required Class
class Fixnum
  def to_roman
    tracker = self
    result = ''
    tracker.div(1000).times do
      result += 'M'
      tracker -= 1000
    end
    tracker.div(900).times do
      result += 'CM'
      tracker -= 900
    end
    tracker.div(500).times do
      result += 'D'
      tracker -= 500
    end
    tracker.div(400).times do
      result += 'CD'
      tracker -= 400
    end
    tracker.div(100).times do
      result += 'C'
      tracker -= 100
    end
    tracker.div(90).times do
      result += 'XC'
      tracker -= 90
    end
    tracker.div(50).times do
      result += 'L'
      tracker -= 50
    end
    tracker.div(40).times do
      result += 'XL'
      tracker -= 40
    end
    tracker.div(10).times do
      result += 'X'
      tracker -= 10
    end
    tracker.div(9).times do
      result += 'IX'
      tracker -= 9
    end
    tracker.div(5).times do
      result += 'V'
      tracker -= 5
    end
    tracker.div(4).times do
      result += 'IV'
      tracker -= 4
    end
    tracker.div(1).times do
      result += 'I'
      tracker -= 1
    end
    result
  end
end

module BookKeeping
  VERSION = 2
end
