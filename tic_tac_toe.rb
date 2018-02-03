def plays(a,b,c,d,e,f,g,h,i)
	all_hash = {1 => a, 2 => b, 3 => c, 4 => d, 5 => e, 6 => f, 7 => g, 8 => h, 9 => i}
	all_squares = [1,2,3,4,5,6,7,8,9]
	taken_squares = []
	(1..9).each do |i|
		if all_hash[i] != ""
			taken_squares.push(i)
		end
	
	end
	untaken_squares = all_squares - taken_squares	
	
	puts all_hash, all_hash[1], taken_squares, all_squares, untaken_squares
	random_pick = untaken_squares.shuffle.pop.to_s
	a = "square"
	 out = a<<random_pick
	return out
end

plays("X","","X","O","","","","","")	