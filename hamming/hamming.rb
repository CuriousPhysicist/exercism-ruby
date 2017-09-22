class Hamming
		
	# This first form got 13 tests passing, on the 14th it failed

	# def self.compute(strand1, strand2)
	# 	if strand1 == strand2 
	# 		0
	# 	else 
	# 		counter = 0
	# 		(0..strand1.length-1).each do |i|
	# 			if strand1[i] != strand2[i] then
	# 				counter += 1
	# 			end
	# 		end
	# 		counter
	# 	end
	# end

	# Refactored the code from above to minimise conditionals
	# Chose a guard clause for the error capture

	def self.compute(strand1, strand2)
		if strand1.length != strand2.length then
			raise ArgumentError
		end 
			
		counter = 0

		(0..strand1.length-1).each do |i|
			if strand1[i] != strand2[i] then
				counter += 1
			end
		end

		counter

	end

end

# required module below

module BookKeeping
	VERSION = 3
end