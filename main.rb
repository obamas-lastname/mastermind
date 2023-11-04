require_relative './mastermind_game_logic'
require_relative './user_interface'

colors = ["red", "orange", "yellow", "green", "blue", "violet"]
game = MastermindGameLogic.new(colors)

ans = UserInterface.get_user_choice.to_i
if ans == 1
  game.generate_user_code
  12.times do
    game.play_round1
    if game.won == true
      break
    end
  end
elsif ans == 2
  12.times do
    game.play_round2
    if game.won == true
      break
    end
  end
end

puts "Your number of tries are over! The correct answer was #{game.secret_code}"
