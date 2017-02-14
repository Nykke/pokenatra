require 'sinatra'
require 'sinatra/reloader'
require 'active_record'


require_relative 'db/connection'

require_relative 'models/pokemon'

get "/pokemons" do
  @pokemons = Pokemon.all
  erb :"pokemon/index"
end

get "/pokemons/:img_url" do
  @pokemon = Pokemon.find(params[:img_url])
  erb :"pokemon/index"
end

post "/pokemons" do
  @pokemon = Pokemon.create(name: params[:name], poke_type: params[:poke_type], cp: params[:cp], img_url: params[:img_url])
  redirect "pokemons/#{@pokemon.id}"
end

get "/pokemons/:id" do
  @pokemon = Pokemon.find(params[:id])
  erb :"pokemon/show"
end

get "pokemons/:name" do
  @pokemon = Pokemon.find(params[:name])
  erb :"pokemon/show"
end

get "pokemon/:poke_type" do
  @pokemon = Pokemon.find(params[:poke_type])
  erb :"pokemon/show"
end

get "pokemon/:cp" do
  @pokemon = Pokemon.find(params[:cp])
  erb :"pokemon/show"
end

put "/pokemons/:id" do
  @pokemon = Pokemon.find(params[:id])
  erb :"pokemon/edit"
end

delete "pokemons/:id" do
  @pokemon = Pokemon.find(params[:id])
  @pokemon.destroy
  redirect("pokemons")
end
