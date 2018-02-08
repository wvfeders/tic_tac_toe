

def plays_random(a,b,c,d,e,f,g,h,i) #this function randomly selects a square from the remaining empty squares for the next "O" play. It takes in contents of all 9 squares (a through i) as input.
	all_hash = {1 => a, 2 => b, 3 => c, 4 => d, 5 => e, 6 => f, 7 => g, 8 => h, 9 => i}
	all_squares = [1,2,3,4,5,6,7,8,9]
	taken_squares = [] #initiates an array that will contain untaken squares
	(1..9).each do |i|
		if all_hash[i] != "" #if a square is taken then it is pushed into the taken_squares array
			taken_squares.push(i)
		end
	end

	untaken_squares = all_squares - taken_squares	
	random_pick = untaken_squares.shuffle.pop.to_s #randommly selects a square from the untaken squares
	a = "square"
	 out = a<<random_pick #"out" concatenates the square number, for example "1", with the word "square" to make "square1" which is returned from the function
	#puts out
	return out

end

def winners(a,b,c,d,e,f,g,h,i) #this function identifies the winning combinations and tests the board to see if a win has occurred
	x_wins = ["X", "X", "X"]
	o_wins = ["O", "O", "O"]	
	all_hash = {1 => a, 2 => b, 3 => c, 4 => d, 5 => e, 6 => f, 7 => g, 8 => h, 9 => i}
	win_squares = [[all_hash[1],all_hash[2],all_hash[3]],[all_hash[3],all_hash[6],all_hash[9]],[all_hash[7],all_hash[8],all_hash[9]],[all_hash[1],all_hash[4],all_hash[7]],[all_hash[1],all_hash[5],all_hash[9]],[all_hash[3],all_hash[5],all_hash[7]],[all_hash[2],all_hash[5],all_hash[8]],[all_hash[4],all_hash[5],all_hash[6]]] #This is an array of  8 triplet hash values that are winning "three in a row" combinations 
	(0..7).each do |i| #This loop looks through each of the 8 triplet winners to see if a win has occurred
		plays = win_squares[i] 
			if plays == x_wins
				$result = "Congratulations X's have won"
				break
			elsif plays == o_wins
				$result = "The O's have won. Please try again"  
				break
			else
				$result = "No winner yet, keep playing"
			end
	end
	return $result #the reult is then sent back to the app and out to the webpage	
end

def plays_ai(a,b,c,d,e,f,g,h,i) #this function uses logic to select the square placement of the next "O" value to avoid losing. It takes in contents of all 9 squares (a through i) as input.
		all_hash = {1 => a, 2 => b, 3 => c, 4 => d, 5 => e, 6 => f, 7 => g, 8 => h, 9 => i}
	all_squares = [a,b,c,d,e,f,g,h,i]

	win1 = {1 => a, 2 => b, 3 => c} #the win 1 through win9 hashes hold the current plays that are used to decide on the next "O" placement
	win2 = {4 => d, 5 => e, 6 => f}
	win3 = {7 => g, 8 => h, 9 => i}
	win4 = {1 => a, 4 => d, 7 => g}
	win5 = {1 => a, 5 => e, 9 => i}
	win6 = {3 => c, 5 => e, 7 => g}
	win7 = {2 => b, 5 => e, 8 => h}
	win8 = {3 => c, 6 => f, 9 => i}

#The following is a cascade of commands that selects the square $ai_pick to be played. The value of $ai_pick may be overwritten as the prgam peoceeds throught the code as the criticality of placement increases as the program progresses
	middle_sides = {2 => b, 4 =>d, 6 => f, 8 => h} #this code selects an empty middle side location
	middle_sides.each do | key , value |
		if value == ""
			$ai_pick = key
		end
	end

	corners = {1 => a, 3 => c, 7 => g, 9 => i}	#middle side locations may be overwritten by a corner 													selection				
	corners.each do |key, value|
		if value == ""
			$ai_pick = key
		end
	end		

#this section checks to see if 2 X's are in row with a blank and then selects the blank square for the next play to block the X's from winning
	win_squares = [win1,win2,win3,win4,win5,win6,win7,win8]
	(0..7).each do |i|							
		three = win_squares[i] 
		x_num = three.select {|k,v| v == "X"} 
		o_num = three.select {|k,v| v == "O"}
		no_num = three.select {|k,v| v == ""}
		if x_num.length == 2 
			if o_num.length < 1
				$ai_pick =  no_num.key("")
			end	
		end
	end	 

#this section checks to see if 2 O's are in a row with a blank and then selects the blank square for the next play to win the game

	(0..7).each do |i|
		three = win_squares[i] 
		x_num = three.select {|k,v| v == "X"} 
		o_num = three.select {|k,v| v == "O"}
		no_num = three.select {|k,v| v == ""}
		if o_num.length == 2 
			if x_num.length < 1
				$ai_pick =  no_num.key("")
			end	
		end			 	
	end

	if all_hash[5] == "" #This selects the midle square if it is open . Thids is always the first play for 							O if it is available
		$ai_pick = 5.to_s 	
	end	

	#These two if statements respond to two unique situations that require a middle side response to avoid eventual loss. Square 2is played but any middle side could be played 
	if all_squares == ["X","","","","O","","","","X"]
		$ai_pick  = 2
	elsif	all_squares == ["","","X","","O","","X","",""]
		$ai_pick  = 2
	end
		
	a = "square"
	 out = a<<$ai_pick.to_s #"out" concatenates the square number, for example "1", with the word "square" to make "square1" which is returned from the function	
	return out
end

# plays_ai("","X","O","X","X","X","X","O","O")	