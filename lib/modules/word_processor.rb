module WordProcessor

  # Attempt to unscramble the given word and return
  # dictionary words that it matches.
  #
  def self.unscramble(scrambled_word)
    Word.where(sorted_text: scrambled_word.split(//).sort.join).pluck(:text)
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
