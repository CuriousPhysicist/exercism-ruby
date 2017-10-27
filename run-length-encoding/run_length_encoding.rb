module RunLengthEncoding
  def self.encode(code)
    encoding = ''
    count = 1
    code.split('').each_with_index do |chr, ind|
      if code[ind] == code[ind + 1]
        count += 1
      else
        encoding += count.to_s unless count == 1
        encoding += chr
        count = 1
      end
    end
    encoding
  end

  def self.decode(encoding)
    code = ''
    number = ''
    encoding.split('').each do |chr|
      if (1..9).include?(chr.to_i)
        number += chr
      else
        if number.empty?
          code += chr
        else
          number.to_i.times { code += chr }
        end
        number = ''
      end
    end
    code
  end
end

module BookKeeping
  VERSION = 3
end
