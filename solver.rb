require File.join(File.dirname(__FILE__), '..', 'tile_puzzle', 'puzzle')

class Puzzle

	class UnsolvablePuzzle < ArgumentError; end

	def solve!
		solve || raise(UnsolvablePuzzle)
	end

	def solve(seen = {})
		puts to_s.gsub(/^/, "\t"*seen.size)
		if solved?
			puts "SOLVED!\n".gsub(/^/, "\t"*seen.size)
			self
		elsif seen[to_s]
			puts "DUP!\n".gsub(/^/, "\t"*seen.size)
			nil
		else
			seen[to_s] = true
			available_moves.
				map { |piece| self.dup.move(*piece).solve(seen.dup) }.
					compact.
						sort_by{ |solution| solution.moves.size }.
							first
		end
	end

end
