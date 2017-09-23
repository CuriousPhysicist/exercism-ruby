class Complement
  def self.of_dna(strand)
    
    result = ""

    case
      when strand == "C"
        result = "G"
      when strand == "G"
        result = "C"
      when strand == "A"
        result = "U"
      when strand == "T"
        result = "A"
    end

    result

  end
end