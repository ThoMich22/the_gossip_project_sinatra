require 'gossip'

class ApplicationController < Sinatra::Base
  
  get '/' do
    erb :index, locals: {gossip: Gossip.all}
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end

  get '/gossips/:id/' do
    puts "Voici le numéro du potin choisi: #{params['id']} !"
    erb :show, locals: {id: params['id'], gossip: Gossip.find(params['id'].to_i)}
  end


end