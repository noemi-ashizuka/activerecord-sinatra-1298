require_relative "config/application"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"
require_relative "models/restaurant"
require 'pry-byebug'

get "/" do
  @restaurants = Restaurant.all
  erb :index # links to the index.erb file in the views
end

get "/restaurants/:id" do
  id = params[:id]
  @restaurant = Restaurant.find(id)
  erb :show
end

post "/restaurants" do
  name = params[:name]
  city = params[:city]
  restaurant = Restaurant.new(name: name, city: city)
  restaurant.save
  redirect "/"
end

# POST
# GET
# PATCH/PUT
# DELETE

# app.rb router + controller

# As a user I can list all the restaurants
# As a user I can see one restaurant's details
# As a user I can add a restaurant (bonus)
