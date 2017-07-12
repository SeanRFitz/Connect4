class Game
	attr_accessor :num_humans, :winner
	
	def initialize
		puts "Welcome to a new game of Connect 4!\n"

		sleep(1)
		
		puts "Is this a 1 or 2 player game?"
		num_humans = gets.chomp
		
		while num_humans != "1" && num != "2"
			puts "Please enter '1' for a 1 player game and '2'
			for a 2 player game."
			num_humans = gets.chomp
		end

		@num_humans = num_humans.to_i
		@winner = nil
	end
end