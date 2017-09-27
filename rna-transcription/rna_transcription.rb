class Complement
  def self.of_dna(strand)
    @unzipped_strand = unzip strand
    DNA.new(@unzipped_strand).convert_to_rna
  end

  class << self
    private
    def unzip(strand)
      strand.split('')
    end
  end
end

class DNA
  def initialize(unzipped_strand)
    @dna = unzipped_strand
    check_strand_is_dna @dna
  end

  def check_strand_is_dna(unzipped_strand)
    @dna = [] unless unzipped_strand.all? { |base| %w[A T C G].one? { |b| b == base } }
  end

  def convert_to_rna
    rna = @dna.map { |base| RNA.find_match_for(base) }
    rna.join
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

