module WordProcessor

  # Attempt to unscramble the given word and return
  # dictionary words that it matches.
  #
  def self.unscramble(scrambled_word)
    Word.where(sorted_text: scrambled_word.split(//).sort.join).pluck(:text)
  end

end
