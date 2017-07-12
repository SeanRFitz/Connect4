class Player
	attr_accessor :name

	def initialize(name=nil)
		@name = name
	end
end

class Human < Player

	def drop
		puts "What column (1-7) do you want to drop the disc in? "
		column = gets.chomp
		if column.length > 1
			return nil
		elsif [1,2,3,4,5,6,7].include?(column.to_i)
			return column.to_i
		else
			nil
		end
	end

end

class Computer < Player

	def drop
		return 1 + rand(7)
	end

end