class Complement
  def self.of_dna(strand)
    DNA.new(strand).convert_to_rna
  end
end

class DNA
  def initialize(nucleotides)
    @dna = unzip nucleotides
  end

  def convert_to_rna
    rna = @dna.map { |base| RNA.find_match_for(base) }
    rna.join
  end
  
  private
  
  def unzip(dna)
    unzipped_dna = dna.split('')
    if unzipped_dna.all? { |base| %w[A T C G].one? { |b| b == base } }
      unzipped_dna
    else
      []
    end
  end
end

class RNA
  def self.find_match_for(base) 
    case base
    when 'C'
      'G'
    when 'G'
      'C'
    when 'T'
      'A'
    when 'A'
      'U'
    else
      raise "Unexpected input for RNA, #{base}"
    end
  end
end

module BookKeeping
  VERSION = 4
end
