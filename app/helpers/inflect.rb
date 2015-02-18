def inflect(num, word)
  return "#{num} #{word}s" if num == 0 || num > 1
  return "1 #{word}"
end
