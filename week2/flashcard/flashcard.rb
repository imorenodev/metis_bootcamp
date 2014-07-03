require 'sinatra'
require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: "postgresql",
  database: "flashcard"
)

class Deck < ActiveRecord::Base
  has_many :cards
end

class Card < ActiveRecord::Base
end

get "/" do
  erb :index
end

get "/decks" do
  @decks = Deck.order("name ASC")
  erb :decks
end

get "/decks/:id" do
  @deck = Deck.find(params[:id])
  erb :deck
end

get "/decks/:id/play_deck" do
  @deck = Deck.find(params[:id])
  @cards = Card.where(deck_id: @deck.id)

  @random_deck = @cards.sample

  erb :play_deck
end

post "/decks/:id/result" do
  @guess = params[:card]["guess"].to_s
  @answer = params[:card]["answer"].to_s
  @card = Card.find(params[:id])

  # if @answer == @guess
  #   redirect to("/win")
  # else
  #   redirect to("/lose")
  # end
end

get "/win" do
  erb :win
end

get "/lose" do
  erb :lose
end
