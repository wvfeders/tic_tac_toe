require "minitest/autorun"

require_relative "playai.rb"



#This code tests the output from the Difficult class found in playai.rb

class Tttai_picks < Minitest::Test 

	def test_assert_that_1_equals_1
		assert_equal(1,1)
	end

	def test_assert_picks_of_blanks
	#plays square1, the last space on the board
	o_move = Difficult.new("","X","X","O","O","X","X","O","O") 
	square_pick = o_move.plays
		assert_equal("square1", o_move.plays)

	#plays square9 to win
	o_move = Difficult.new("X","X","","O","X","X","O","O","") 
	square_pick = o_move.plays	
	assert_equal("square9", o_move.plays)

	#plays square3 to block
	o_move = Difficult.new("X","X","","O","O","X","O","X","") 
	square_pick = o_move.plays	
		assert_equal("square3", o_move.plays)	

	#plays square5 as first move
	o_move = Difficult.new("X","","","","","","","","") 
	square_pick = o_move.plays	
		assert_equal("square5", o_move.plays)

	#plays square6 to win
	o_move = Difficult.new("X","","","O","O","","X","","X") 
	square_pick = o_move.plays	
		assert_equal("square6", o_move.plays)
	

	end	
end	