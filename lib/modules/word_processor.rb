module WordProcessor

  # Attempt to unscramble the given word and return
  # dictionary words that it matches.
  #
  def self.unscramble(scrambled_word)
    Word.where(sorted_text: scrambled_word.split(//).sort.join).
      order("frequency DESC").
      pluck(:text)
  end

  # Given a word containing multiple ? return all dictionary words
  # that match it's given pattern.
  #
  def self.fill_in_the_blanks(word)
    Word.where("text like ?",word.gsub('?','_')).
      order("frequency DESC").
      pluck(:text)
  end

  # Generate anagrams of length 3 and above from the given word.
  #
  def self.anagram(word)
    words = []
    chars = word.split(//)

    (3..chars.length).each do |length|
      chars.combination(length).each do |combination|
        words << combination.sort.join
      end
    end

    Word.where(sorted_text: words).pluck(:text).sort{|a,b| a.length <=> b.length}
  end

end
