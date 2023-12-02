require "./lib/cypher"

describe Cypher do
  describe "#initialize" do
    it "creates an instance of Cypher" do
      cypher = Cypher.new
      expect(cypher).to be_a(Cypher)
    end
    it "has an alphabet" do
      cypher = Cypher.new
      expect(cypher.instance_variable_get(:@alphabet)).to eq(('a'..'z').to_a)
    end
  end

  describe "#encode" do
    it "can encode a string" do
      cypher = Cypher.new
      expect(cypher.encode("hello", 3)).to eq("khoor")
    end
    it "can encode a string with spaces" do
      cypher = Cypher.new
      expect(cypher.encode("hello world", 3)).to eq("khoor zruog")
    end
    it "can encode a string with punctuation" do
      cypher = Cypher.new
      expect(cypher.encode("hello, world!", 3)).to eq("khoor, zruog!")
    end
  end
  describe "#decode" do
    it "can decode a string" do
      cypher = Cypher.new
      expect(cypher.decode("khoor", 3)).to eq("hello")
    end
    it "can decode a string with spaces" do
      cypher = Cypher.new
      expect(cypher.decode("khoor zruog", 3)).to eq("hello world")
    end
    it "can decode a string with punctuation" do
      cypher = Cypher.new
      expect(cypher.decode("khoor, zruog!", 3)).to eq("hello, world!")
    end
  end

end
