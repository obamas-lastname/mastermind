
class UserInterface
    def get_user_guess(colors)
        puts "Type 4 colors from the following list in the order you wish to guess, separated by a space:"
        view(colors)
        a = gets.chomp
        array = a.split(' ')
        array
    end

    def self.display_guess_feedback(correct, exists, attempts)
        puts "#{exists} colors guessed right, but at the wrong position"
        puts "#{correct} colors guessed right, at the right position"
        puts "Attempts remaining: #{12 - attempts}"
    end

    def self.display_win_message
        puts "You guessed correctly!"
    end

    def self.view(colors)
        colors.each do |x| 
            puts x
        end
    end
end