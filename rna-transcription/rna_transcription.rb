# initial form for first 2 iterations
# class Complement
#   def self.of_dna(strand)
    
#     return '' if strand == ''

#     unzipped_dna = strand.split("")

#     build_rna_from(unzipped_dna)

#   end

#   def self.build_rna_from(dna_array)

#     rna_array = dna_array.map do |base|

#       return '' unless %w[A T C G].one? { |b| b == base }

#       case
#         when base == "C"
#           result = "G"
#         when base == "G"
#           result = "C"
#         when base == "A"
#           result = "U"
#         when base == "T"
#           result = "A"
#       end
#     end

#     rna_array.join

#   end
# end

# Refactor to ensure single responsibility and make more OO in design

class Complement
  
  def self.of_dna(strand)
    
    return '' if strand == ''

    unzipped_dna = strand.split("")

    build_rna_from(unzipped_dna)

  end

  def self.build_rna_from(dna_array)

    rna_array = dna_array.map do |base|

      return '' unless %w[A T C G].one? { |b| b == base }

      RNA.find_match_for(base)
      
    end

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