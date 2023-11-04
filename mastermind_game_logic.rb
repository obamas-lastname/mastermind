
class MastermindGameLogic
  attr_accessor :secret_code
    def initialize(colors)
        @colors = colors
        @secret_code = computer_guess(colors)
        @attempts = 0
    end

    def generate_user_code(user_code)
      @secret_code = user_code
    end

    def computer_guess(colors)
      @colors.sample(4)
    end

    def compare_guess(guess)
        exists = 0
        correct = 0
        @secret_code.each_with_index do |code_color, i|
            if guess[i].downcase == code_color
              correct += 1
            elsif @secret_code.include?(guess[i].downcase)
              exists += 1
            end
        end
    
        [correct, exists]
    end
    
    def play_round2
        guess = UserInterface.get_user_guess(@colors)
        @attempts += 1
        correct, exists = compare_guess(guess)
    
        if correct == 4
          UserInterface.display_win_message
        else
          UserInterface.display_guess_feedback(correct, exists, @attempts)
        end
    end

    def play_round1
      guess = computer_guess(@colors)
      @attempts += 1
      correct, exists = compare_guess(guess)

      if correct == 4
        UserInterface.display_win_message
      else
        UserInterface.display_guess_feedback(correct, exists, @attempts)
      end
    end

end
