class SearchPresenter
  attr_reader :word, :root

  def initialize(word)
    search = Search.new(word)
    @root = search.word_root
    @word = word
  end

  def is_valid?
    if @root
      true
    else
      false
    end
  end
end
