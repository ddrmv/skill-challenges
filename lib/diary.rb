require 'diary_entry'
# made for phase2 bite8 exercise1
class Diary
  def initialize
    @entries = []
  end

  def add(entry) # entry is an instance of DiaryEntry
    @entries << entry
  end

  def all
    return @entries
  end

  def count_words
    counter = 0
    @entries.each do |entry|
      counter += entry.count_words
    end
    return counter
  end

  def reading_time(wpm)
    counter = 0
    @entries.each do |entry|
      counter += entry.reading_time(wpm)
    end
    return counter
  end

  def find_best_entry_for_reading_time(wpm, minutes)
    fail "No entries found." if @entries.empty?

    readable_entries = @entries.select do |entry|
      entry.reading_time(wpm) <= minutes
    end

    readable_entries.sort_by do | entry |
      entry.count_words
    end.last
  end
end
