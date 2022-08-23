require 'diary'
require 'diary_entry'

RSpec.describe "integration" do
  it "add and list multiple entries" do
    diary = Diary.new()
    diary_entry_1 = DiaryEntry.new("title_1", "one two")
    diary_entry_2 = DiaryEntry.new("title_2", "one two")
    diary.add(diary_entry_1)
    diary.add(diary_entry_2)
    expect(diary.all).to eq [diary_entry_1, diary_entry_2]
  end

  context "#count_words" do
    it "counts 0 words initially" do
      diary = Diary.new()
      expect(diary.count_words).to eq 0
    end

    it "counts number of words in entries added" do
      diary = Diary.new()
      diary_entry = DiaryEntry.new("title_1", "content 1")
      diary.add(diary_entry)
      expect(diary.count_words).to eq 2
    end

    it "counts number of words in entries added" do
      diary = Diary.new()
      diary_entry = DiaryEntry.new("title_1", "content 1")
      diary_entry_2 = DiaryEntry.new("title_2", "content 2")
      diary.add(diary_entry)
      diary.add(diary_entry_2)
      expect(diary.count_words).to eq 4
    end
  end


  context "#reading_time(wpm)" do
    it "returns reading time of 0" do
      diary = Diary.new()
      expect(diary.reading_time(10)).to eq 0
    end
    
    it "returns reading time of 5 with multiple entries" do
      diary = Diary.new()
      diary_entry = DiaryEntry.new("title_1", "one two three")
      diary_entry_2 = DiaryEntry.new("title_2", "four five")
      diary.add(diary_entry)
      diary.add(diary_entry_2)
      expect(diary.reading_time(1)).to eq 5
    end
  end

  context "#find_best_entry_for_reading_time(wpm, minutes)" do
    it "returns optimal entry out of multiple entries" do
      diary = Diary.new()
      diary_entry_1 = DiaryEntry.new("title_1", "one two three four five six seven")
      diary_entry_2 = DiaryEntry.new("title_2", "one two three")
      diary_entry_3 = DiaryEntry.new("title_3", "one two three four")
      diary_entry_4 = DiaryEntry.new("title_4", "one two")
      diary.add(diary_entry_1)
      diary.add(diary_entry_2)
      diary.add(diary_entry_3)
      diary.add(diary_entry_4)
      expect(diary.find_best_entry_for_reading_time(1, 5)).to eq diary_entry_3
    end

    it "returns optimal entry out of very close entries" do
      diary = Diary.new()
      diary_entry_1 = DiaryEntry.new("title_1", "one two three four five six seven")
      diary_entry_2 = DiaryEntry.new("title_2", "one two three")
      diary_entry_3 = DiaryEntry.new("title_3", "one two three four")
      diary_entry_4 = DiaryEntry.new("title_4", "one two")
      diary.add(diary_entry_1)
      diary.add(diary_entry_2)
      diary.add(diary_entry_3)
      diary.add(diary_entry_4)
      expect(diary.find_best_entry_for_reading_time(1, 3)).to eq diary_entry_2
    end

    it "raise error message if no entries found" do
      diary = Diary.new()
      expect{ diary.find_best_entry_for_reading_time(1, 3) }.to raise_error "No entries found."
    end
  end 


end