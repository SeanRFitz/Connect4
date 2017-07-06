require "game_board"

describe Board do
	subject(:board) {Board.new}

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

	describe ".win?" do
		context "when a column of 4 Xs" do
			it "returns true" do
				expect(Board.win?).to eql(true)
			end
		end

		context "when a column of 4 Os" do
			it "returns true" do
				expect(Board.win?).to eql(true)
			end
		end
	end
end