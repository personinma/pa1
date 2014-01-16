class MovieData

	def load_data
		# data is a multi-d array to store the data set's info
		data = Array.new(1) {Array.new(4)}
		begin
			file = File.open("u.data")
			while line = file.gets
				line.split(" ") # thinking about taking out timestamp
				data.push(line)
			end
		ensure
			file.close
		end
		return data
	end
	
	def popularity(movie_id)
		# pop_factor is used to store the popularity factor of a movie
		pop_factor = 0.0
		
		return pop_factor
	end
	
	def popularity_list
		# pop_list used to store list of movies and popularity
		pop_list = Array.new(1) {Array.new(2)} 
		
		return pop_list
	end
	
	def similarity(user1,user2)
		# sim_factor similarity factor between user1 & user2
		sim_factor = 0.0 
		
		return sim_factor
	end

	def most_similar(u)
		# similar_list is used to store users with similar taste as user u & respective sim_factor
		similar_list = Array.new(1) {Array.new(2)}
		
		return similar_list
	end
end

