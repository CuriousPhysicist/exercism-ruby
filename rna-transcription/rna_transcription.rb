class Complement
  
  def self.of_dna(strand)

    unzipped_dna = strand.split("")

    return '' unless unzipped_dna.all? { |base| %w[A T C G].one? { |b| b == base } }

    build_rna_from(unzipped_dna)

  end

  private

  def self.build_rna_from(dna_array)

    rna_array = dna_array.map { |base| RNA.find_match_for(base) } 

    rna_array.join
    
  end
end

class RNA

  def self.find_match_for(base)
    case
      when base == "C"
        return "G"
      when base == "G"
        return "C"
      when base == "T"
        return "A"
      when base == "A"
        return "U"
    end
  end

end

module BookKeeping
  VERSION = 4
end