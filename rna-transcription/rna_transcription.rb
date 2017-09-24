class Complement
  def self.of_dna(strand)
    
    unzipped_dna = strand.split("")

    return '' unless unzipped_dna.all? { |base| %w[A T C G].one? { |b| b == base } }

    build_rna_from(unzipped_dna)

  end

  def self.build_rna_from(dna_array)

    rna_array = dna_array.map do |base|

      case
        when base == "C"
          result = "G"
        when base == "G"
          result = "C"
        when base == "A"
          result = "U"
        when base == "T"
          result = "A"
      end
    end

  rna_array.join

  end
end

module BookKeeping
  VERSION = 4
end