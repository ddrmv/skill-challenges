require 'check_for_todo'

RSpec.describe "check_for_todo method" do
  it "returns false when given empty string" do
    expect(check_for_todo("")).to eq false
  end

  it "returns false when includes part of #TODO (#TOD)" do
    expect(check_for_todo("#TOD one")).to eq false
  end

  it "returns false when string is random" do
    expect(check_for_todo("one two")).to eq false
  end

  it "returns false #TODO is broken up with space" do
    expect(check_for_todo("#TO DO one")).to eq false
  end

  context "includes #TODO" do
    it "returns true if #TODO is surrounded by non-space characters" do
      expect(check_for_todo("aa#TODOone")).to eq true
    end

    it "returns true if #TODO is at the end of string" do
      expect(check_for_todo("one two #TODO")).to eq true
    end

    it "returns true if #TODO is at the end of string" do
      expect(check_for_todo("one two #TODO")).to eq true
    end
  end
end