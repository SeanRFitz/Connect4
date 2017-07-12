class Board
	attr_accessor :rows

	def initialize
		@rows = ([
				["_","_","_","_","_","_","_"],
				["_","_","_","_","_","_","_"],
				["_","_","_","_","_","_","_"],
				["_","_","_","_","_","_","_"],
				["_","_","_","_","_","_","_"],
				["_","_","_","_","_","_","_"],
				["_","_","_","_","_","_","_"],
				])
	end

	def display
		(0..6).each do |row|
			puts "|#{@rows[row].join("|")}|"
		end
		puts "|=============|"
	end

	def win?
		# Check rows
		7.times do |row|
			row -= 1
			cur_row = @rows[row]
				if cur_row.count("X") < 4 && cur_row.count("O") < 4
					next
				else
					counter, value = 0, "" 
					cur_row.each do |cell|
						if cell == "_"
							value = ""
							next
						else
							if value == ""
								value = cell
								counter += 1
							elsif cell == value
								counter += 1
							else
								value = cell
								counter = 1
							end

							if counter == 4
								return true
							end
						end
					end
				end
		end
		false
	end

	def tie?
		if @rows.each do |row|
			row.each do |cell|
				if cell == "_"
					return false
				end
			end
		end
		end
		true
	end

	def update(turn,column)
		if turn % 2 == 0
			disc = "O"
		else
			disc = "X"
		end

		column -= 1
		cur_row = 6
		while  @rows[cur_row][column] != "_"
			cur_row -= 1
			if cur_row < 0
				return false
			end
		end
		@rows[cur_row][column] = disc
	end
end