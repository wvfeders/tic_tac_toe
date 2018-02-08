require "minitest/autorun"
require_relative "tic_tac_toe.rb"

class Tttrandom_picks < Minitest::Test 

	def test_assert_that_1_equals_1
		assert_equal(1,1)
	end

	def test_assert_picks_of_blanks
		assert_equal("square1", plays_random("","X","X","O","O","X","X","O","O"))
		assert_equal("square9", plays_random("X","X","O","O","X","X","O","O",""))
		refute_equal("square1", plays_random("X","","","","","","","",""))
		refute_equal("square9", plays_random("X","","","","","","","","O"))
	end	

	def test_assert_winners
		assert_equal("Congratulations X's have won", winners("X","X","X","O","X","O","X","O","O"))
		assert_equal("Congratulations X's have won", winners("X","X","O","O","X","X","O","O","X"))
		assert_equal("The O's have won. Please try again", winners("X","X","O","O","O","O","X","O","X"))
		assert_equal("The O's have won. Please try again", winners("O","X","X","X","O","X","O","O","O"))
		assert_equal("No winner yet, keep playing", winners("X","","O","","X","","","","O"))
		assert_equal("No winner yet, keep playing", winners("X","","","","X","","O","","O"))
	end

	def test_assert_ai_picks
		assert_equal("square5", plays_ai("X","","","","","","","","O"))
		assert_equal("square3", plays_ai("X","X","","","O","","","","O"))
		assert_equal("square6", plays_ai("X","X","","O","O","","","",""))
		assert_equal("square8", plays_ai("X","","","","X","","O","","O"))
		refute_equal("square4", plays_ai("X","","","X","","","","","O"))
	end	


end		