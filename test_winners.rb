require "minitest/autorun"
require_relative "tic_tac_toe.rb"
#this prgoram tests the winners function in tic_tac_toe.rb

class Tests_winners < Minitest::Test 

	def test_assert_that_1_equals_1
		assert_equal(1,1)
	end
	def test_assert_winners
		assert_equal("Congratulations X's have won", winners("X","X","X","O","X","O","X","O","O"))
		assert_equal("Congratulations X's have won", winners("X","X","O","O","X","X","O","O","X"))
		assert_equal("The O's have won. Please try again", winners("X","X","O","O","O","O","X","O","X"))
		assert_equal("The O's have won. Please try again", winners("O","X","X","X","O","X","O","O","O"))
		assert_equal("No winner yet, keep playing", winners("X","","O","","X","","","","O"))
		assert_equal("No winner yet, keep playing", winners("X","","","","X","","O","","O"))
	end


end		