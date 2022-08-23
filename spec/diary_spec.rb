require 'diary'

RSpec.describe Diary do
  context "initially" do
    describe "#all" do
      it "returns empty array" do
        diary = Diary.new()
        expect(diary.all).to eq []
      end
    end
  end


end