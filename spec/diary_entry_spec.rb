require 'diary_entry'

RSpec.describe DiaryEntry do
  it ".title returns the title as a string" do
    diary_entry = DiaryEntry.new("My Title", "two words")
    expect(diary_entry.title).to eq "My Title"
  end

  it ".contents returns the contents as a string" do
    diary_entry = DiaryEntry.new("", "One two three!")
    expect(diary_entry.contents).to eq "One two three!"
  end

  it ".count_words counts correctly 1000 words of contents" do
    thousand_words = (1..1000).to_a.join(", ")
    diary_entry = DiaryEntry.new("", thousand_words)
    expect(diary_entry.count_words).to eq 1000
  end

  it ".reading_time raises error if reading speed is 0 or less" do
    diary_entry = DiaryEntry.new("title", "one two")
    msg = "Reading speed needs to be a positive number."
    expect{ diary_entry.reading_time(0) }.to raise_error msg
  end

  it ".reading_time returns 5 for 850 words and 200 wpm" do
    many_words = (1..850).to_a.join(", ")
    diary_entry = DiaryEntry.new("title", many_words)
    expect(diary_entry.reading_time(200)).to eq 5
  end

  it ".reading_time returns 1 for 200 words and 200 wpm" do
    many_words = (1..200).to_a.join(", ")
    diary_entry = DiaryEntry.new("title", many_words)
    expect(diary_entry.reading_time(200)).to eq 1
  end

  it ".reading_time returns 0 for 0 words and 200 wpm" do
    diary_entry = DiaryEntry.new("title", "")
    expect(diary_entry.reading_time(200)).to eq 0
  end

  it ".reading_chunk returns successive chunks" do
    diary_entry = DiaryEntry.new("", "one two three four five six seven eight nine")
    expect(diary_entry.reading_chunk(2,2)).to eq "one two three four"
    expect(diary_entry.reading_chunk(2,2)).to eq "five six seven eight"
  end

  it ".reading_chunk returns from the start after iterating" do
    diary_entry = DiaryEntry.new("", "one two three four five six seven eight nine")
    diary_entry.reading_chunk(2,2)
    diary_entry.reading_chunk(2,2)
    diary_entry.reading_chunk(2,2)
    expect(diary_entry.reading_chunk(2,2)).to eq "one two three four"
  end
end