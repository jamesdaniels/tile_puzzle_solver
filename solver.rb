require File.join(File.dirname(__FILE__), '..', 'tile_puzzle', 'puzzle')

class Puzzle

	def solutions(permutations = [self])
		if (solved = permutations.select(&:solved?)).empty?
			solutions permutations.map { |permutation| permutation.available_moves.map { |piece| permutation.clone.move(*piece) }}.flatten
		else
			return solved
		end
	end

end
