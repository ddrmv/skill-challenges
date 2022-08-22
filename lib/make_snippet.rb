def make_snippet(str)
  snippet_arr = str.split(" ")
  if snippet_arr.length > 5
    snippet_arr = snippet_arr[0..4].join(" ")
    snippet_arr << "..."
  else
    snippet_arr.join(" ")
  end
end
