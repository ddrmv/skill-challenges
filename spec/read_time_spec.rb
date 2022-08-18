require 'read_time'

RSpec.describe "read_time method" do
  it "returns 0 when string has no words" do
    result = read_time("")
    expect(result).to eq 0
  end

  it "returns 1 when contains one word" do
    result = read_time("one")
    expect(result).to eq 1
  end

  it "returns 2 when contains 300 words" do
    number = 0
    string = ""
    while number < 300
      string << "a "
      number += 1
    end
    result = read_time(string)
    expect(result).to eq 2
  end

  it "returns 2 when contains 400 words" do
    number = 0
    string = ""
    while number < 400
      string << "a "
      number += 1
    end
    result = read_time(string)
    expect(result).to eq 2
  end

  it "returns 10 when contains 2000 words" do
    number = 0
    string = ""
    while number < 2000
      string << "a "
      number += 1
    end
    result = read_time(string)
    expect(result).to eq 10
  end

end
