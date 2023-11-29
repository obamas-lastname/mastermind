require_relative './mastermind_game_logic'
require_relative './user_interface'
require_relative './gui'

GUI.logo
GUI.rules
colors = [1, 2, 3, 4, 5, 6]

loop do
  game = MastermindGameLogic.new(colors)
  ans = UserInterface.get_user_choice
  if ans == 1
    game.generate_user_code
    puts game.secret_code
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

  puts "Game over! The correct answer was:"
  UserInterface.view(game.secret_code)
  if UserInterface.get_user_again != 'y'
    break
  end
end

