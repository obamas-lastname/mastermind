colors = Array.new(6)
colors[0] = "red"
colors[1] = "orange"
colors[2] = "yellow"
colors[3] = "green"
colors[4] = "blue"
colors[5] = "violet"

def view(colors)
    colors.each do |x| 
        puts x
    end
end

 
def comp_guess(colors)
    guess = Array.new(4)
    guess = colors.sample(4)
    guess
end

def usr_guess(colors)
    puts "Type 4 colors from the following list in the order you wish to guess, separated by a space:"
    view(colors)
    a = gets.chomp
    array = a.split(' ')
    array
end

def compare(guess1, guess2)
    exists = 0
    correct = 0
    for i in 0..3
        for j in 0..3
            if guess1[i].downcase === guess2[j] && i == j
                correct = correct+1
            elsif guess1[i].downcase === guess2[j] && i!=j
                exists = exists+1
            end
        end
    end

    if correct == 4
        puts "You guessed correctly!"
        return 1
    else
        puts "#{exists} colors guessed right, but at the wrong position"
        puts "#{correct} colors guessed right, at the right position"
    end
end

def round(colors)
    guess2 = comp_guess(colors)
    for i in 1..12
        guess1 = usr_guess(colors)
        if(compare(guess1, guess2)==1)
            return
        end
    end
    puts "Your number of tries are over! The correct answer was #{guess2}"
end

round(colors)
