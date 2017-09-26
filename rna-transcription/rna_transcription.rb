class Complement

  def self.of_dna(strand)
    dna = DNA.new(strand)
    build_rna_from(dna.strand)
  end

  class << self
    private
    def build_rna_from(dna)
      rna = dna.map { |base| RNA.find_match_for(base) }
      rna.join
    end
  end
end

class DNA
  
  def initialize (dna)
    unzip (dna)
  end
  
  def strand
    @dna
  end
  
  private
  
  def unzip (dna)
    unzipped_dna = dna.split("")
    if unzipped_dna.all? { |base| %w[A T C G].one? { |b| b == base } } then
      @dna = unzipped_dna
    else
      @dna = []
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
        raise "Unexpected input for RNA, #{base}"
    end
  end
end

module BookKeeping
  VERSION = 4
end
