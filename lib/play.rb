require_relative "game"
require_relative "player"
require_relative "game_board"

### I should refactor this entire section

# Create first game
round1 = Game.new

# Create players
if round1.num_humans == 1
	puts "What is the name of the first player? "
	name = gets.chomp
	player1 = Human.new(name)
	player2 = Computer.new("Mister Roboto")
else
	puts "What is the name of the first player? "
	name = gets.chomp
	player1 = Human.new(name)

	puts "What is the name of the second player? "
	name = gets.chomp
	player2 = Human.new(name)
end

# Create game board
board1 = Board.new

# Start playing
board1.display
turn = 0
while true
	turn += 1

	# player 1 plays
	column = nil
	while column == nil
		column = player1.drop
	end
	board1.update(turn,column)
	board1.display
	if board1.win?
		round1.winner = player1.name
		puts "player 1 wins"
		break
	end
	if board1.tie?
		puts "it's a tie"
		break
	end
	
	turn += 1
	# player 2 plays
	column = nil
	while column == nil
		column = player2.drop
	end
	board1.update(turn,column)
	board1.display
	if board1.win?
		round1.winner = player2.name
		puts "player 1 wins"
		break
	end
	if board1.tie?
		puts "it's a tie"
		break
	end

end