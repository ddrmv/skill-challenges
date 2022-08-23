class DiaryEntry
  def initialize(title, contents)  # title, contents are strings
    @title = title
    @contents = contents
    @bookmark = 0
  end

  def title
    @title
  end

  def contents
    @contents
  end

  def count_words
    @contents.split(" ").length
  end

  def reading_time(wpm)
    if wpm <= 0
      raise "Reading speed needs to be a positive number."
    else
      (self.count_words / wpm.to_f).ceil
    end   
  end

  def reading_chunk(wpm, minutes)
    amount_of_text_to_read = wpm * minutes
    old_bookmark = @bookmark
    if @bookmark + amount_of_text_to_read > self.count_words
      @bookmark = 0
    else
      @bookmark += amount_of_text_to_read
    end
    @contents.split[old_bookmark, amount_of_text_to_read].join(" ")
  end
end