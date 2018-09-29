class Random < Algorithm
	def execute(mem_refs)
		mem_refs.each do |value|
			if cache.frames.include?(value)
				@hits += 1
			else
				@misses += 1
				if cache.frames.include?(Cache::EMPTY_FRAME)
					empty_frame_index = cache.frames.index(Cache::EMPTY_FRAME)
					cache.frames[empty_frame_index] = value
				else
					random_index = rand(0..cache.size) % cache.size
					cache.frames[random_index] = value
				end	
			end	
		end
	end
end
