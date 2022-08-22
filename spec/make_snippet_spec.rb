require 'make_snippet'

RSpec.describe "make snippet" do
  it "returns first five words of the string input" do
    result = make_snippet("Hello, welcome to my diary. This is the first sentence.")
    expect(result).to eq "Hello, welcome to my diary...."
  end

  it "returns two words when two words are passed into the string" do
    result = make_snippet("Hello welcome.")
    expect(result).to eq "Hello welcome."
  end

  it "returns empty string when parameter is empty" do
    result = make_snippet("")
    expect(result).to eq ""
  end
end
