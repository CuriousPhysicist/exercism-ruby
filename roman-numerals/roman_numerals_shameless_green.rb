# Required Class
class Fixnum
  def to_roman
    tracker = self
    result = ''
    tracker.div(1000).times { result += 'M'; tracker -= 1000 }
    tracker.div(900).times { result += 'CM'; tracker -= 900 }
    tracker.div(500).times { result += 'D'; tracker -= 500 }
    tracker.div(400).times { result += 'CD'; tracker -= 400 }
    tracker.div(100).times { result += 'C'; tracker -= 100 }
    tracker.div(90).times { result += 'XC'; tracker -= 90 }
    tracker.div(50).times { result += 'L'; tracker -= 50 }
    tracker.div(40).times { result += 'XL'; tracker -= 40 }
    tracker.div(10).times { result += 'X'; tracker -= 10 }
    tracker.div(9).times { result += 'IX'; tracker -= 9 }
    tracker.div(5).times { result += 'V'; tracker -= 5 }
    tracker.div(4).times { result += 'IV'; tracker -= 4 }
    tracker.div(1).times { result += 'I'; tracker -= 1 }
    result
  end
end

module BookKeeping
  VERSION = 2
end
