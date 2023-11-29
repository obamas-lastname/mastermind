
class MastermindGameLogic
    attr_accessor :secret_code, :won
    def initialize(colors)
        @colors = colors
        @secret_code = computer_guess(colors)
        @attempts = 0
        @won = false
    end

    def generate_user_code
      @secret_code = UserInterface.get_user_code(@colors)
      #@secret_code.map(&:to_i)
    end

    def computer_guess(colors)
      @colors.sample(4)
    end

    def compare_guess(guess)
      exists = 0
      correct = 0
      puts @secret_code
      puts guess
      guess.each_with_index do |code_color, i|
        if @secret_code[i].to_i == code_color.to_i
          correct += 1
        elsif @secret_code.include?(code_color.to_i)
          exists += 1
        end
      end
    
      return [correct, exists]
    end
    
    def play_round2
      guess = UserInterface.get_user_guess(@colors)
      puts ''
      puts "***Your guess: ***"
      UserInterface.view(guess)
      puts ''
      @attempts += 1
      correct, exists = compare_guess(guess)
    
      if correct == 4
        UserInterface.display_win_message
        @won = true
      else
        UserInterface.display_guess_feedback(correct, exists, @attempts)
      end
    end

    def play_round1
      guess = computer_guess(@colors)
      puts guess
      puts ''
      puts "***Computer's guess: ***"
      UserInterface.view(guess)
      puts ''
      @attempts += 1
      correct, exists = compare_guess(guess)

      if correct == 4
        UserInterface.display_win_message
        @won = true
      else
        UserInterface.display_guess_feedback(correct, exists, @attempts)
      end
    end

end
