require_relative './mastermind_game_logic'
require_relative './user_interface'

colors = ["red", "orange", "yellow", "green", "blue", "violet"]
game = MastermindGameLogic.new(colors)

12.times do
  game.play_round
end

puts "Your number of tries are over! The correct answer was #{game.secret_code}"
