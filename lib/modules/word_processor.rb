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
    words = Set.new
    chars = word.gsub('?','_').split(//)

    (3..chars.length).each do |length|
      chars.combination(length).each do |combination|
        blank_count = combination.count '_'
        sorted_combination = combination.sort.join

        if blank_count == 0
          words << sorted_combination
        else
          sorted_combination = [sorted_combination.delete('_')]

          blank_count.times do 
            buffer = []

            sorted_combination.each do |combination|
              buffer += permute_with_blank combination
            end

            sorted_combination = buffer
          end #blank_count

          words += sorted_combination
        end

      end #each combination
    end #combination length

    Word.where(sorted_text: words.to_a).
      pluck(:text).
      sort{|a,b| b.length <=> a.length}
  end


  private

  # Permute a blank (? char) at all possible valid locations in the
  # given string with sorted letters.
  #
  def self.permute_with_blank(letters)
    permutations = []

    (0..letters.length).each do |index|
      ('a'..'z').each do |char|
        if (index == 0 || letters[index-1] <= char) && 
          (index == letters.length || letters[index] >= char)
          permutations << letters.clone.insert(index,char) 
        end
      end
    end

    permutations
  end

end
