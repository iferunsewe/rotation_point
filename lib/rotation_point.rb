class RotationPoint 
	attr_reader :is
	def initialize(words=[])
		raise "Words must be in an array" unless words.is_a? Array
		raise "All words must be strings" unless words.all?{ |word| word.is_a? String }
		@words = words
		@words_with_points = {}
		@is = find_rotation_point
	end	

	
	private

	def find_rotation_point
		build_word_index_hash
		sort_words_alphabetically[0][1]
	end

	def build_word_index_hash
		@words.each do |word| 
			@words_with_points[word] = @words.index(word) 
		end
		@words_with_points
	end	

	def sort_words_alphabetically
		@words_with_points.sort_by{|word, index| word[0]}
	end	
end
