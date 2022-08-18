def read_time(str)
  number_of_words = str.split.length
  time = number_of_words / 200.to_f
  time = time.ceil
end
