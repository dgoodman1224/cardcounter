require "cardcounter/version"
require 'colorize'

require_relative 'deck.rb'
require "fakework"

module CardCounter
	CARD_COUNTING_VALUES = {
		2 => 1,
		3 => 1,
		4 => 1,
		5 => 1,
		6 => 1,
		7 => 0,
		8 => 0,
		9 => 0,
		10 => -1,
		11 => -1,
	}

	def self.run_program
		puts "Welcome to card counter, a way to practice counting cards vis the command line"
		puts "We use standard counting, where 2-6 = +1, 7-9 = 0, and 10-A = -1"
		puts "Press enter when you are ready to move on"
		move_on = gets.chomp
		run_round
	end

	def self.run_round
		get_settings_for_counting
		start_counting
		count_again?
	end

	def self.get_settings_for_counting
		@count = 0
		system("clear")
		puts 'How many decks would you like to use?'
		@deck_number = gets.chomp.to_i
		puts 'Great, about how much time would you like ex: 15 second'
		@time_to_count = gets.chomp.to_i
		puts "And finally what speed do you want? Easy, Medium or Hard?"
		@level = gets.chomp.downcase
		if @level == 'easy'
			@speed = 1.0
		elsif @level == 'medium'
			@speed = 0.75
		elsif @level == 'hard'
			@speed = 0.5
		else
			puts 'You didnt quite listen there, lets just go medium'
			@speed = 0.75
		end
	end

	def self.start_counting
		@cards = []
		@deck_number.times {@cards += Deck.new.cards}
		@cards.shuffle!
		countdown
		count_cards
	end

	def self.countdown
		system"clear"
		counter = 3
		3.times do
			puts "Lets begin in .........."
			puts "                #{counter}"
			counter -= 1
			sleep(1); system("clear")
		end
	end

	def self.count_cards
		ending_time = Time.now + @time_to_count
		until Time.now > ending_time
			if @cards.empty?
				puts 'No cards left'.red
				break
			end
			card = @cards.pop
			puts "#{card.rank}"
			@count += CARD_COUNTING_VALUES[card.value]
			sleep(@speed)
			system("clear")
			sleep(0.10)
		end
		guess_count
	end

	def self.guess_count
		puts 'Time is up. What is the count?'.blue
		guessed_count = gets.chomp.to_i
		puts "You guessed #{guessed_count} the correct count is #{@count}"
		3.times {puts ''}
		if guessed_count == @count
			puts "You crushed it that is correct!  Count was #{@count}"
		elsif @count != 0
			puts "You were off by #{(((@count - guessed_count).to_f/@count) *100).abs}%"
		else
			puts "The count was even should have guessed 0".red
		end
	end

	def self.count_again?
		puts "Would like you like to play again?"
		puts 'Please say yes or no, or boss and we will make it look like you are doing work'
		answer = gets.chomp
		if answer == 'yes' || answer == 'y'
			run_round
		elsif answer == 'boss'
			print_fake_work_things
		else
			puts 'Cool, see you later and enjoy your new money'
		end
	end

	def self.print_fake_work_things
		FakeWork.git_work
		sleep(0.5)
		FakeWork.up_to_date
	end
end
