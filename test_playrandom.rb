require "minitest/autorun"

require_relative "playrandom.rb"

#This code tests the output from the Easy class found in playrandom.rb

class Tttrandom_picks < Minitest::Test 

	def test_assert_that_1_equals_1
		assert_equal(1,1)
	end

	def test_assert_picks_of_blanks

	#plays square1 as the last square on the board
	o_move = Easy.new("","X","X","O","O","X","X","O","O") 
	square_pick = o_move.plays
		assert_equal("square1", o_move.plays)

	#plays square9 as the last square on the board
	o_move = Easy.new("X","X","O","O","X","X","O","O","") 
	square_pick = o_move.plays	
		assert_equal("square9", o_move.plays)

	#plays square5 as the last square on the board
	o_move = Easy.new("X","X","O","O","","X","O","O","X") 
	square_pick = o_move.plays	
		assert_equal("square5", o_move.plays)		

	#does  not play square1 since it is taken
	o_move = Easy.new("X","","","","","","","","") 
	square_pick = o_move.plays	
		refute_equal("square1", o_move.plays)

	#does  not play square9 since it is taken
	o_move = Easy.new("X","","","","","","","","O") 
	square_pick = o_move.plays	
		refute_equal("square9", o_move.plays)

	#does  not play square4 since it is taken
	o_move = Easy.new("X","","","X","X","","","","O") 
	square_pick = o_move.plays	
		refute_equal("square4", o_move.plays)			

	end	
end	