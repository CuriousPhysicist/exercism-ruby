class Hamming
	def self.compute(strand1, strand2)
		if strand1 == strand2 
			0
		else 
			counter = 0
			(0..strand1.length-1).each do |i|
				if strand1[i] != strand2[i] then
					counter += 1
				end
			end
			counter
		end
	end
end