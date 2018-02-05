require "sinatra"
require_relative "tic_tac_toe.rb"


get '/' do
	erb :tic_tac_toe_home
end

post '/play' do
	square1 = params[:square1]
	square2 = params[:square2]
	square3 = params[:square3]
	square4 = params[:square4]
	square5 = params[:square5]
	square6 = params[:square6]
	square7 = params[:square7]
	square8 = params[:square8]
	square9 = params[:square9]
		



	puts square1, square2,square3,square4,square4,square5,square6,square7,square8,square9
	

 redirect 'board?square1=' + square1 + '&square2=' + square2 + '&square3=' + square3 + '&square4=' + square4 + '&square5=' + square5 + '&square6=' + square6 + '&square7=' + square7 + '&square8=' + square8 + '&square9=' + square9
end

get '/board' do
	square1 = params[:square1]
	square2 = params[:square2]
	square3 = params[:square3]
	square4 = params[:square4]
	square5 = params[:square5]
	square6 = params[:square6]
	square7 = params[:square7]
	square8 = params[:square8]
	square9 = params[:square9]

square_pick = plays(square1,square2,square3,square4,square5,square5,square7,square8,square9)
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
a_winner = winners(square1,square2,square3,square4,square5,square5,square7,square8,square9)
	erb :tic_tac_toe_play, :locals => {:square1 => square1, :square2 => square2, :square3 => square3, :square4 => square4, :square5 => square5, :square6 => square6, :square7 => square7, :square8 => square8, :square9 => square9, :a_winner => a_winner}	
end	