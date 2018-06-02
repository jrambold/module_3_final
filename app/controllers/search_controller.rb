class SearchController < ApplicationController
  def index
    @search = SearchPresenter.new(params['q'])
  end
end
