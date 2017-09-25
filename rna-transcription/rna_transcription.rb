class Complement
  
  def self.of_dna(strand)

    unzipped_dna = strand.split("")
    unzipped_dna.all? { |base| %w[A T C G].one? { |b| b == base } } ? build_rna_from(unzipped_dna) : ''

  end

  class << self

    private

    def build_rna_from(dna)

      rna = dna.map { |base| RNA.find_match_for(base) } 

      rna.join
      
    end

  end

end

class RNA

  def self.find_match_for(base)
    
    case base
      when "C"
        "G"
      when "G"
        "C"
      when "T"
        "A"
      when "A"
        "U"
      else
        raise 'Unexpected input for RNA'
    end
  end

end

module BookKeeping
  VERSION = 4
end