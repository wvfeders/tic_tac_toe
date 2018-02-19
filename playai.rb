class Difficult
  def initialize(a,b,c,d,e,f,g,h,i)  
    # Instance variables  
    @s1 = a 
    @s2 = b 
    @s3 = c 
    @s4 = d
    @s5 = e 
    @s6 = f 
    @s7 = g
    @s8 = h
    @s9 = i  
  end 

def plays #this function uses logic to select the square placement of the next "O" value to avoid losing. It takes in contents of all 9 squares (a through i) as input.
		all_hash = {1 => @s1, 2 => @s2, 3 => @s3, 4 => @s4, 5 => @s5, 6 => @s6, 7 => @s7, 8 => @s8, 9 => @s9}
	all_squares = [@s1, @s2, @s3, @s4, @s5, @s6, @s7, @s8, @s9]

	win1 = {1 => @s1, 2 => @s2, 3 => @s3} #the win 1 through win9 hashes hold the current plays that are used to decide on the next "O" placement
	win2 = {4 => @s4, 5 => @s5, 6 => @s6}
	win3 = {7 => @s7, 8 => @s8, 9 => @s9}
	win4 = {1 => @s1, 4 => @s4, 7 => @s7}
	win5 = {1 => @s1, 5 => @s5, 9 => @s9}
	win6 = {3 => @s3, 5 => @s5, 7 => @s7}
	win7 = {2 => @s2, 5 => @s5, 8 => @s8}
	win8 = {3 => @s3, 6 => @s6, 9 => @s9}

#The following is a cascade of commands that selects the square $ai_pick to be played. The value of $ai_pick may be overwritten as the program proceeds through the code as the criticality of placement increases as the program progresses
	middle_sides = {2 => @s2, 4 => @s4, 6 => @s6, 8 => @s8} #this code selects an empty middle side location
	middle_sides.each do | key , value |
		if value == ""
			$ai_pick = key
		end
	end

	corners = {1 => @s1, 3 => @s3, 7 => @s7, 9 => @s9}	#middle side locations may be overwritten by a corner 													selection				
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

	if all_hash[5] == "" #This selects the midle square if it is open . This is always the first play for 							O if it is available
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
	#puts out
	return out
end





end