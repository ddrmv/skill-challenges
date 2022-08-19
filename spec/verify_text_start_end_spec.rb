require 'verify_text_start_end'

RSpec.describe "verify_text_start_end method" do
  it "returns false when starting with lower case letter" do
    result = verify_text_start_end("correct?")
    expect(result).to eq false
  end

  it "returns false when starting with punctuation" do
    result = verify_text_start_end("?Correct?")
    expect(result).to eq false
  end

  it "returns false when given empty string" do
    result = verify_text_start_end("")
    expect(result).to eq false
  end

  context "when starting with capital letter" do
    it "returns true if ending on ." do
      result = verify_text_start_end("This sentence is correct.")
      expect(result).to eq true
    end

    it "returns true if ending on ?" do
      result = verify_text_start_end("Correct?")
      expect(result).to eq true
    end

    it "returns true if ending on !" do
      result = verify_text_start_end("Correct!")
      expect(result).to eq true
    end

    it "returns false if ending on ," do
      result = verify_text_start_end("This is,")
      expect(result).to eq false
    end

    it "returns false if only one character long" do
      result = verify_text_start_end("A")
      expect(result).to eq false
    end
  end
end
