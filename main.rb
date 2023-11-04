require_relative './mastermind_game_logic'
require_relative './user_interface'

colors = ["red", "orange", "yellow", "green", "blue", "violet"]
game = MastermindGameLogic.new(colors)

if UserInterface.get_user_choice == 1
  game.generate_user_code(UserInterface.get_user_code(colors))
  12.times do
  game.play_round1
  end
elsif UserInterface.get_user_choice == 2
  12.times do
    game.play_round1
    end
end

puts "Your number of tries are over! The correct answer was #{game.secret_code}"
