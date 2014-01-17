class MovieData

	def load_data
		# data is a multi-d array to store the data set's info
		data = Array.new(1) {Array.new(4)}
		begin
			file = File.open("u.data")
			while line = file.gets
				line.split(" ") # thinking about taking out timestamp
				data.push([line[0],line[1],line[2]])
			end
		ensure
			file.close
		end
		return data
	end
	
	def popularity(movie_id)
		count = 0
		rating = 0.0
		data = load_data
		
		data.each do {|user, mov_id, rate|
			if mov_id == movie_id
				count += 1
				rating = ((rating * (count-1)) + rate) / count
			end
		}

		# I'm choosing to use a weight of .2 on number of users who have
		# seen the movie + a weight of 0.8 on the actual rating itself
		# so that if a movie has very few people watching it, but was given 
		# a high rating, it isn't all that telling since sample size is 
		# slightly small. Overall though, avg movie rating is still king
		return (count * 0.2) + (rating * 0.8)
	end
	
	def popularity_list
		# pop_list used to store list of movies and popularity
		pop_list = Array.new(1) {Array.new(2)} 
		
		return pop_list
	end
	
	def similarity(user1,user2)
		user1_list1 = Hash.new
		user2_list2 = Hash.new
		data = load_data

		data.each do {|user, mov_id, rate|
			if user == user1
				user1_list[mov_id] = rate
			elsif user == user2
				user2_list[mov_id] = rate
			else
			end			
		}

		# number common movies of the two user lists
		common = user1_list.keys & user2_list.keys

		# will revisit later when I think of a way that includes taking 
		# their ratings of their common movies also into the equation
		return common.length / (user1_list.length + user2_list.length - common.length)
	end

	def most_similar(u)
		# similar_list is used to store users with similar taste as user u & respective sim_factor
		similar_list = Array.new(1) {Array.new(2)}
		
		return similar_list
	end
end

