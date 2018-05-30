class SearchController < ApplicationController
  def index
    search = Search.new(params['q'])
    search.word_roots
    @validation = "true"
  end
end
