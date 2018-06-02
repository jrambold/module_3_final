class Search
  def initialize(word)
    @search_service = OxfordService.new
    @word = word
  end

  def word_root
    raw_dictionary = @search_service.get_inflections(@word)
    if raw_dictionary
      find_root(raw_dictionary)
    else
      nil
    end
  end

  private

  def find_root(raw_dictionary)
    root = raw_dictionary[:results].first[:lexicalEntries].first[:inflectionOf].first[:id]
  end
end
