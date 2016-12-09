class String
  def capitalize_all_words
    self.split.map(&:capitalize).join(" ")
  end
end
