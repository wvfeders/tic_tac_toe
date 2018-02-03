require "sinatra"


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

	erb :tic_tac_toe_play, :locals => {:square1 => square1, :square2 => square2, :square3 => square3, :square4 => square4, :square5 => square5, :square6 => square6, :square7 => square7, :square8 => square8, :square9 => square9}	
end	