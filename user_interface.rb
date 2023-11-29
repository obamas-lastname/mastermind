require File.dirname(__FILE__) + '\colored-master\lib\colored.rb'
class UserInterface
    def self.get_user_guess(colors)
        puts "----Type the number of 4 colors from the following list in the order you wish to guess, separated by a space:"
        view(colors)
        a = gets.chomp
        array = a.split(' ')
        array
    end

    def self.get_user_code(colors)
        puts "----Type the number of 4 colors from the following list that will form your secret code separated by a space:"
        view(colors)
        a = gets.chomp
        array = a.split(' ')
        new_arr = array.map { | item | item.to_i }
        new_arr
    end

    def self.get_user_choice
        puts "----Do you want to create the secret code or guess it? (1/2)"
        a = gets.chomp
        a.to_i
    end

    def self.get_user_again
        puts "----Do you want to play again? (y/n)"
        a = gets.chomp
        a
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
        for i in 0..6
            x = colors[i].to_i
            if x == 1
                print "   1   ".white_on_red
            elsif x == 2
                print "   2   ".white_on_yellow
            elsif x == 3
                print "   3   ".white_on_green
            elsif x == 4
                print "   4   ".white_on_blue
            elsif x == 5
                print "   5   ".white_on_cyan
            elsif x == 6
                print "   6   ".white_on_magenta
            end
        end
    end
end
