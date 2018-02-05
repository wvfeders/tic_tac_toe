def plays_random(a,b,c,d,e,f,g,h,i) #this function randomly selects a square from the remaining empty squares
	all_hash = {1 => a, 2 => b, 3 => c, 4 => d, 5 => e, 6 => f, 7 => g, 8 => h, 9 => i}
	all_squares = [1,2,3,4,5,6,7,8,9]
	taken_squares = [] #initiates an array that will contain untaken squares
	(1..9).each do |i|
		if all_hash[i] != "" #if a square is taken then itiis pushed into the taken_squares aray
			taken_squares.push(i)
		end
	
	end
	untaken_squares = all_squares - taken_squares	
	
	#puts all_hash, all_hash[1], taken_squares, all_squares, untaken_squares
	random_pick = untaken_squares.shuffle.pop.to_s #randommly selects a square from the untaken squares
	a = "square"
	 out = a<<random_pick #"out" concatenates the square number, for example "1", with the word "square" to make "square1" which is returned from the function
	#puts out
	return out

end

def winners(a,b,c,d,e,f,g,h,i)
	x_wins = ["X", "X", "X"]
	o_wins = ["O", "O", "O"]	
	all_hash = {1 => a, 2 => b, 3 => c, 4 => d, 5 => e, 6 => f, 7 => g, 8 => h, 9 => i}
	win_squares = [[all_hash[1],all_hash[2],all_hash[3]],[all_hash[3],all_hash[6],all_hash[9]],[all_hash[7],all_hash[8],all_hash[9]],[all_hash[1],all_hash[4],all_hash[7]],[all_hash[1],all_hash[5],all_hash[9]],[all_hash[3],all_hash[5],all_hash[7]],[all_hash[2],all_hash[5],all_hash[8]],[all_hash[4],all_hash[5],all_hash[6]]]
	(0..7).each do |i|
		plays = win_squares[i] #if a square is taken then itiis pushed into the taken_squares aray
		#print i, plays
			if plays == x_wins
				$result = "Congratulations X's have won"
				break
			elsif plays == o_wins
				$result = "Congratulations O's have won"
				break
			else
				$result = "No winner yet, keep playing"
			end

	end
#puts $result
	return $result	
end

def plays_ai(a,b,c,d,e,f,g,h,i)
		all_hash = {1 => a, 2 => b, 3 => c, 4 => d, 5 => e, 6 => f, 7 => g, 8 => h, 9 => i}
	all_squares = [1,2,3,4,5,6,7,8,9]
	taken_squares = [] #initiates an array that will contain untaken squares
	# (1..9).each do |i|
	# 	if all_hash[i] != "" #if a square is taken then itiis pushed into the taken_squares aray
	# 		taken_squares.push(i)
	# 	end
	# end
	if all_hash[5] == ""
		ai_pick = 5.to_s 	
	end	
	a = "square"
	 out = a<<ai_pick #"out" concatenates the square number, for example "1", with the word "square" to make "square1" which is returned from the function	
	return out
end

puts plays_ai("O","c","X","X","","X","O","a","O")	