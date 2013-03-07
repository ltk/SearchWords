class Word
  @@list = {}

  attr_reader :text, :hits

  def self.list
    @@list
  end

  def self.clear_list
    @@list = {}
    self
  end

  def self.depluralized_list
    depluralize(@@list)
  end

  def initialize(text, hits)
    @text = text
    @hits = hits
  end

  def tally
    list = @@list
    if list.has_key? text
      list[text] += hits
    elsif not a_stop_word?
      list[text] = hits
    end
  end

  private

  def self.stop_words
    %w(a able about across after all almost also am among an and any are as at be because been but by can cannot could dear did do does either else ever every for from get got had has have he her hers him his how however i if in into is it its just least let like likely may me might most must my neither no nor not of off often on only or other our own rather said say says she should since so some than that the their them then there these they this tis to too twas us wants was we were what when where which while who whom why will with would yet you your)
  end

  def self.depluralize(word_list)
    # Any way to do this more elegantly with #inject?
    list = word_list.clone
    list.each do |word, hits|
      singular_word = word.singularize
      if (word != singular_word) && list.has_key?(singular_word)
        list[singular_word] += hits
        list.delete(word)
      end
    end
    list
  end

  def a_stop_word?
    self.class.stop_words.include?(text)
  end
end