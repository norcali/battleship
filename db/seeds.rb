# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

params = {}

params[:game] = {}
Game.create params[:game]

params[:user] = {name: "Usuario", game: Game.first}
params[:ai] = {name: "AI", game: Game.first}
User.create params[:user]
User.create params[:ai]

params[:board] = {user: User.first}
params[:board_ai] = {user: User.last}

Board.create params[:board]
Board.create params[:board_ai]

