class Easy
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

 def plays #(@s1,@s2,@s3,@s4,@s5,@s6,@s7,@s8,@s9) #this function randomly selects a square from the remaining empty squares for the next "O" play. It takes in contents of all 9 squares (a through i) as input.
	all_hash = {1 => @s1, 2 => @s2, 3 => @s3, 4 => @s4, 5 => @s5, 6 => @s6, 7 => @s7, 8 => @s8, 9 => @s9}
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
	# puts out
	return out
  end	
end	
