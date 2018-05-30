class SearchController < ApplicationController
  def index
    search = Search.new(params['q'])
    root = search.word_root
    @word = { word: params['q'], root: root }
  end
end
