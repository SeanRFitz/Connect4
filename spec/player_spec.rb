require "player"

describe Player do
	describe ".new" do
		context "when a human specifies a name" do
			it "creates a new instance of the player class with the name" do
				name = "John"
				player1 = Player.new(name)
				expect(player1.name).to eql(name)
			end
		end
	end
end

describe Human do
	subject(:player1) { Human.new("John") }

	describe ".new" do
		context "when a human specifies a name" do
			it "creates a new instance of the human class with the name" do
				expect(player1.name).to eql("John")
			end
		end 
	end

	describe "#drop" do
		context "when a player specifies a valid column (1-7)" do
			it "returns the column number" do
				allow(player1).to receive(:gets).and_return("5")
				expect(player1.drop).to eql(5)
			end
		end

		context "when a player specifies an invalid column" do
			it "(0) returns nil" do
				allow(player1).to receive(:gets).and_return("0")
				expect(player1.drop).to eql(nil)
			end
			it "(1.5) returns nil" do
				allow(player1).to receive(:gets).and_return("1.5")
				expect(player1.drop).to eql(nil)
			end
			it "(a) returns nil" do
				allow(player1).to receive(:gets).and_return("a")
				expect(player1.drop).to eql(nil)
			end
			it "tacos returns nil" do
				allow(player1).to receive(:gets).and_return("tacos")
				expect(player1.drop).to eql(nil)
			end
		end
	end


end

describe Computer do
	subject(:player2) {Computer.new("Mister Computer")}
	describe ".new" do
		context "when a human specifies a name" do
			it "creates a new instance of the human class with the name" do
				expect(player2.name).to eql("Mister Computer")
			end
		end 
	end

	describe "#drop" do
		it "returns a number between 1 and 7" do
			allow(player2).to receive(:rand).and_return(4)
			expect(player2.drop).to eql(5)
		end
	end
end