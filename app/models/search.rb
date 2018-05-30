class Search
  def initialize(word)
    @search_service = OxfordService.new
    @word = word
  end

  def word_root
    raw_dictionary = @search_service.get_url("/api/v1/inflections/en/#{@word}")
    find_root(raw_dictionary)
  end

  private

  def find_root(raw_dictionary)
    root = raw_dictionary[:results].first[:lexicalEntries].first[:inflectionOf].first[:id]
  end
end
