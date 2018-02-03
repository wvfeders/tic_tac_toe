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
	if plays(square1,square2,square3,square4,square5,square5,square7,square8,square9) == "square1"
		square1 = "O"
	elsif plays(square1,square2,square3,square4,square5,square5,square7,square8,square9) == "square2"
		square2 = "O"
	elsif plays(square1,square2,square3,square4,square5,square5,square7,square8,square9) == "square3"
		square3 = "O"
	elsif plays(square1,square2,square3,square4,square5,square5,square7,square8,square9) == "square4"
		square4 = "O"
	elsif plays(square1,square2,square3,square4,square5,square5,square7,square8,square9) == "square5"
		square5 = "O"
	elsif plays(square1,square2,square3,square4,square5,square5,square7,square8,square9) == "square6"
		square6 = "O"
	elsif plays(square1,square2,square3,square4,square5,square5,square7,square8,square9) == "square7"
		square7 = "O"
	elsif plays(square1,square2,square3,square4,square5,square5,square7,square8,square9) == "square8"
		square8 = "O"
	elsif plays(square1,square2,square3,square4,square5,square5,square7,square8,square9) == "square9"
		square9 = "O"
	end		



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

	erb :tic_tac_toe_play, :locals => {:square1 => square1, :square2 => square2, :square3 => square3, :square4 => square4, :square5 => square5, :square6 => square6, :square7 => square7, :square8 => square8, :square9 => square9}	
end	