require "game_board"

describe Board do
	subject(:board) {Board.new}
	let(:winning_horizontalX) {
		[
			["_","_","_","_","_","_","_"],
			["_","_","_","_","_","_","_"],
			["_","_","_","_","_","_","_"],
			["_","_","_","_","_","_","_"],
			["_","_","_","_","O","_","O"],
			["O","X","X","X","X","O","O"],
			["X","X","X","O","X","O","O"],
		]
	}
	let(:winning_horizontalO) {
		[
			["_","_","_","_","_","_","_"],
			["_","_","_","_","_","_","_"],
			["_","_","_","_","_","_","_"],
			["_","_","_","_","_","_","_"],
			["_","_","_","_","_","_","_"],
			["_","_","_","_","_","_","_"],
			["X","X","X","O","O","O","O"],
		]
	}
	let(:tie_board) {
		[
			["O","X","X","O","X","O","O"],
			["O","X","O","O","O","X","X"],
			["X","O","X","O","X","O","X"],
			["X","O","X","X","O","O","X"],
			["O","X","O","X","O","X","O"],
			["O","X","X","O","X","O","O"],
			["X","X","X","O","X","O","X"],
		]
	}

	describe ".new" do
		it "creates an empty board" do
			expect(board.rows).to eql([
				["_","_","_","_","_","_","_"],
				["_","_","_","_","_","_","_"],
				["_","_","_","_","_","_","_"],
				["_","_","_","_","_","_","_"],
				["_","_","_","_","_","_","_"],
				["_","_","_","_","_","_","_"],
				["_","_","_","_","_","_","_"],
				])
		end
	end

	describe "#win?" do
		
		context "when a column of 4 Os" do
			before { board.rows = winning_horizontalO }

			it "returns true" do
				expect(board.win?).to eql(true)
			end
		end

		context "when a column of 4 Xs" do
			before { board.rows = winning_horizontalX }

			it "returns true" do
				
				expect(board.win?).to eql(true)
			end
		end

		context "when no one has 4 in a row" do
			before { board.rows = tie_board }
			it "returns false" do
				expect(board.win?).to eql(false)
			end
		end
	end

	describe "#tie?" do
		context "when the board is full" do
			before { board.rows = tie_board }

			it "returns true" do
				expect(board.tie?).to eql(true)
			end
		end

		context "when the board is not full" do
			it "returns false" do
				expect(board.tie?).to eql(false)
			end
		end
	end

	describe "#update" do
		context "on the first turn the player drops disc in the first column" do
			before do
				turn = 1
				column = 1
				board.update(turn,column) 
			end

			it "adds an X" do
				expect(board.rows[6][0]).to eql("X")
			end
		end

		context "on the 2nd turn the player drops a disc on top of player 1's" do
			before do 
				turn = 1
				column = 1
				board.update(turn,column)
				turn = 2
				board.update(turn,column)
			end

			it "adds an O on top of X" do

				expect(board.rows[6][0]).to eql("X")
				expect(board.rows[5][0]).to eql("O")
			end
		end
	end
end