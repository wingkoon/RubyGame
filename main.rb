require_relative 'player'
require_relative 'question'
require_relative 'game'

puts "Welcome to the Math Game!"

player1_name = "player1"

player2_name = "player2"

game = Game.new(player1_name, player2_name)
game.play

puts "Good bye!"