def verify_text_start_end(string)
  return false if string.length < 2
  first_is_uppercase = ("A".."Z").include?(string.chars.first)
  last_is_valid_punctuation = "!?.".include?(string.chars.last)
  return first_is_uppercase && last_is_valid_punctuation
end