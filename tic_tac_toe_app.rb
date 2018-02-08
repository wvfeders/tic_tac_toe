require "sinatra"

require_relative "tic_tac_toe.rb"


get '/' do
	erb :tic_tac_toe_home
end

post '/play' do
	opponent = params[:opponent]
	square1 = params[:square1]
	square2 = params[:square2]
	square3 = params[:square3]
	square4 = params[:square4]
	square5 = params[:square5]
	square6 = params[:square6]
	square7 = params[:square7]
	square8 = params[:square8]
	square9 = params[:square9]
	
 	redirect 'board?opponent=' + opponent + '&square1=' + square1.upcase + '&square2=' + square2.upcase + '&square3=' + square3.upcase + '&square4=' + square4.upcase + '&square5=' + square5.upcase + '&square6=' + square6.upcase + '&square7=' + square7.upcase + '&square8=' + square8.upcase + '&square9=' + square9.upcase
end

get '/board' do
	opponent = params[:opponent]
	square1 = params[:square1]
	square2 = params[:square2]
	square3 = params[:square3]
	square4 = params[:square4]
	square5 = params[:square5]
	square6 = params[:square6]
	square7 = params[:square7]
	square8 = params[:square8]
	square9 = params[:square9]

	if opponent == "Easy"
		square_pick = plays_random(square1,square2,square3,square4,square5,square6,square7,square8,square9)
	elsif opponent == "Difficult"
		square_pick = plays_ai(square1,square2,square3,square4,square5,square6,square7,square8,square9)
	elsif opponent == "not_chosen"
		square_pick = ""
	end
	
	#a_winner is evaluated after the 'X' has been played
	a_winner = winners(square1,square2,square3,square4,square5,square6,square7,square8,square9)
	if a_winner != "Congratulations X's have won" #an 'O' square is produced if X's have not won
		if square_pick == "square1"
			square1 = "O"
		elsif square_pick == "square2"
			square2 = "O"
		elsif square_pick == "square3"
			square3 = "O"
		elsif square_pick == "square4"
			square4 = "O"
		elsif square_pick == "square5"
			square5 = "O"
		elsif square_pick == "square6"
			square6 = "O"
		elsif square_pick == "square7"
			square7 = "O"
		elsif square_pick == "square8"
			square8 = "O"
		elsif square_pick == "square9"
			square9 = "O"
		end	
	end
	
	#a_winner is reevaluated after the 'O' has been played
	a_winner = winners(square1,square2,square3,square4,square5,square6,square7,square8,square9)

	if opponent == "not_chosen" #If the player failed to select a difficulty level, he is directed to a separate erb for instructions
		erb :choose_difficulty
	else		
		erb :tic_tac_toe_play, :locals => {:opponent => opponent, :square1 => square1, :square2 => square2, :square3 => square3, :square4 => square4, :square5 => square5, :square6 => square6, :square7 => square7, :square8 => square8, :square9 => square9, :a_winner => a_winner}	
	end
end	