
require 'gossip'

class ApplicationController < Sinatra::Base
  
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
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
    #Gossip.find(params['id'].to_i)
    erb :show, locals: {id: params['id'], gossip: Gossip.find(params['id'].to_i)}
    #erb :show, locals: {gossip: Gossip.find(params['id'].to_i)
  end

  get '/gossips/:id/edit/' do
    puts "Voici le numéro du potin à modifier: #{params['id']} !"
    erb :edit, locals: {id: params['id']}
  end

  post '/gossips/:id/edit/' do
    puts "Voici le numéro du potin à modifier: #{params['id']} !"
    Gossip.update(params['id'], params["gossip_author"], params["gossip_content"])
    redirect '/'
  end
end