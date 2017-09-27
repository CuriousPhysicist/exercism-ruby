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
  def initialize(unzipped_strand)
    @dna = unzipped_strand
    check_strand_is_dna @dna
  end

  def convert_to_rna
    RNA.new.convert(@dna)
  end

  private

  def check_strand_is_dna(unzipped_strand)
    @dna = [] unless unzipped_strand.all? do |base|
      %w[A T C G].one? { |b| b == base }
    end
  end
end

# This class performs the conversion on a valid strand
class RNA
  def initialize
    @option = { C: 'G', G: 'C', T: 'A', A: 'U' }
  end

  def convert(dna)
    rna = dna.map { |base| find_match_for(base) }
    rna.join
  end

  private

  def find_match_for(base)
    @option.fetch base.to_sym
  rescue KeyError
    raise "Unexpected input for RNA, #{base}"
  end
end

module BookKeeping
  VERSION = 4
end
