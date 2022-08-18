require 'count_words'

RSpec.describe "count_words method" do
  it "returns 0 for empty string" do
    expect(count_words("")).to eq 0
  end
  
  it "returns 3 for 'today is sunny'" do
    expect(count_words("today is sunny")).to eq 3
  end
  
end