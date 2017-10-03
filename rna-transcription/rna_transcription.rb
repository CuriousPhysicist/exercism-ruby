# Primary class used to recieve and prepare the input strand for processing
class Complement
  def self.of_dna(strand)
    unzipped_strand = unzip strand
    DNA.new(unzipped_strand).convert_to_rna
  end
  class << self
    private

    def unzip(strand)
      strand.split('')
    end
  end
end

# This class checks the validity of the input strand
class DNA
  attr_reader :dna_nucleotides

  def initialize(unzipped_strand)
    @dna_nucleotides = %w[A T C G]
    @dna = unzipped_strand
    check_strand_is_dna @dna
  end

  def convert_to_rna
    RNA.new(dna_nucleotides).convert(@dna)
  end

  private

  def check_strand_is_dna(unzipped_strand)
    @dna = [] unless unzipped_strand.all? do |base|
      dna_nucleotides.one? { |b| b == base }
    end
  end
end

# This class performs the conversion on a valid strand
class RNA
  attr_reader :rna_nucleotides
  attr_reader :dna_nucleotides

  def initialize(dna_nucleotides)
    @dna_nucleotides = dna_nucleotides
    @rna_nucleotides = %w[U A G C]
    @option = link_nucleotides
  end

  def convert(dna)
    dna.map { |base| find_match_for(base) }.join
  end

  private

  def link_nucleotides
    dna_nucleotides.zip(rna_nucleotides).to_h
  end

  def find_match_for(base)
    @option.fetch base
  rescue KeyError
    raise "Unexpected input for RNA, #{base}"
  end
end

module BookKeeping
  VERSION = 4
end
