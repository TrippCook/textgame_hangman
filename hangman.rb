@word_array = ["falcon", "force", "franchise", "opening", "trilogy", "saber", "master", "imperial", "soundtrack", "awakens", "clone", "general", "droid", "resistance", "rebel", "episode", "cantina", "empire", "princess"]  # word selection for the game

@word_letter_arr = []  # line 8 will push the individual letters of the game word to this array 

def gameword
	word = @word_array.shuffle.first  # selects a random word from the @word_array 
	
	@word_letter_arr = word.chars.to_a  # pushes the individual letters to the array created on line 3

	puts "Your word is " + word.length.to_s + " characters long."

	return word
end

def wrong1          # these next lines are for the hangman graphic as the player gets more wrong answers
	puts "______" 
	puts "|    |"
	puts "|    O"
	puts "|"
	puts "|"
	puts "|"
end

def wrong2
	puts "______" 
	puts "|    |"
	puts "|    O"
	puts "|    |"
	puts "|"
	puts "|"
end

def wrong3
	puts "______" 
	puts "|    |"
	puts "|    O"
	puts "|   \\|"
	puts "|"
	puts "|"
end

def wrong4
	puts "______" 
	puts "|    |"
	puts "|    O"
	puts "|   \\|/"
	puts "|"
	puts "|"
end

def wrong5
	puts "______" 
	puts "|    |"
	puts "|    O"
	puts "|   \\|/"
	puts "|    |"
	puts "|"
end

def wrong6
	puts "______" 
	puts "|    |"
	puts "|    O"
	puts "|   \\|/"
	puts "|    |"
	puts "|   /"
end

def wrong7
	puts "______" 
	puts "|    |"
	puts "|    O"
	puts "|   \\|/"
	puts "|    |"
	puts "|   / \\"
end

def letterplay( word )  # this method is the heart of the player interaction

	@wrong_guesses_arr = []  # wrong answers in gameplay are pushed here for display

	wrong_ans = 0

	guess_array = Array.new(word.length,'_')

	while (wrong_ans < 7) && (guess_array.include? '_')
		puts "Guess a new letter or type 'QUIT' to exit."
		letter = gets.chomp.downcase
		if letter.length != 1
			until letter.length == 1
				if letter == "QUIT".upcase
					puts "Thank you for playing!"
					break
				else
					puts "Guess a new *single* letter or type 'QUIT' to exit."
					letter = gets.chomp.downcase
				end
			end
		else
			if @word_letter_arr.include? letter
				puts "Congrats! Yes, the word has that letter."
				position1 = word.index(letter)  
				position2 = word.rindex(letter)
				if position1 == position2
					guess_array.delete_at(position1)
					guess_array.insert(position1, letter)

					puts "Correct guesses:"
					puts guess_array.join

					puts "Incorrect guesses:"
					puts @wrong_guesses_arr.join
				else
					guess_array.delete_at(position1)
					guess_array.insert(position1, letter)

					guess_array.delete_at(position2)
					guess_array.insert(position2, letter)

					puts "Correct guesses:"
					puts guess_array.join

					puts "Incorrect guesses:"
					puts @wrong_guesses_arr.join
				end
			else
				puts "I'm sorry, that letter is not part of the word."
				@wrong_guesses_arr.push letter

				puts "Correct guesses:"
				puts guess_array.join

				puts "Incorrect guesses:"
				puts @wrong_guesses_arr.join

				wrong_ans +=  1
				if wrong_ans == 1
					wrong1
				elsif wrong_ans == 2
					wrong2
				elsif wrong_ans == 3
					wrong3
				elsif wrong_ans == 4
					wrong4
				elsif wrong_ans == 5
					wrong5
				elsif wrong_ans == 6
					wrong6
				else
					wrong7
					puts "The correct word is " + word + "."

				end
			end
		end
	end

	if (guess_array.include? '_')
		puts "I'm sorry, you have lost this game."
	else
		puts "Congrats!  You have won this game!"
	end

end

	#game introduction
puts "Hello, what is your name?"
name = gets.chomp.capitalize
puts "Greetings, Padawan " + name +"!"
puts 
puts "Shall we play a game?" #mixing references

while true
	puts "Please enter DO or DO NOT."
	answer = gets.chomp.downcase
	if (answer == 'do'|| answer == 'do not')
		if answer == 'do'
			selected_word = gameword
			letterplay( selected_word )

			puts "Shall we play the game again?" 

		elsif answer == 'do not'
			puts 'Goodbye, and may the Force be with you!'  # Yep, mixing references
			break
		end
	elsif answer == 'try'
		puts 'I need a "DO" or "DO NOT" answer, please.  There is no TRY.'
	else
		puts 'I need a "DO" or "DO NOT" answer, please.'
	end
end
