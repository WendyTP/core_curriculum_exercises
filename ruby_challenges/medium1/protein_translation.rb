=begin
requirement: translate rna strand (a string) into protein(array of strings)
- translation stop immediately when a STOP codon is encountered (return only translated proteins)
"AUGUUUUCU" --> ["AUG", "UUU", "UCU"]
["AUG", "UUU", "UCU"] --> ["Methionine", "Phenylalanine", "Serine"]
data: array; hash {"Methionien" -> [AUG]; "Pheny" -> [UUU, UUC]}
algorithm:
  - split strands by 3 letters (a list of codons)
  - valid if all "codons" are in the codon list
     - if not, raise error
  - iterate through each codon and translate to correspond protein
  - stop iterate if condon is STOP
  - return the translated proteins
=end

class InvalidCodonError < StandardError ; end


class Translation
  CODON_AMINOS_SETS = {
    ["AUG"] => "Methionine",
    ["UUU", "UUC"] => "Phenylalanine",
    ["UUA", "UUG"] => "Leucine",
    ["UCU", "UCC", "UCA", "UCG"] => "Serine",
    ["UAU", "UAC"] => "Tyrosine",
    ["UGU", "UGC"] => "Cysteine",
    ["UGG"] => "Tryptophan",
    ["UAA", "UAG", "UGA"] => "STOP"
  }

  def self.of_rna(strand)
    codons = split_rna(strand)
    raise InvalidCodonError.new("invalid strand given!") unless valid_strand?(strand,codons)
    codons.each_with_object([]) do |codon, rna|
      amino = of_codon(codon)
      return rna if amino == "STOP"
      rna << amino
    end
  end

  def self.of_codon(codon)
    amino = ""
    CODON_AMINOS_SETS.each do |key, value|
      amino = value if key.include?(codon)
    end
    amino
  end

  def self.split_rna(strand)
    strand.scan(/\w\w\w/)
  end

  def self.valid_strand?(original_strand,splitted_strand)
    return false if original_strand != splitted_strand.join

    correct_codons = CODON_AMINOS_SETS.keys.flatten
    splitted_strand.each do |codon|
      return false unless correct_codons.include?(codon)
    end
    true
  end
end


