require 'rails_helper'

describe SearchPresenter do
  context "Instance methods" do
    context "word and root" do
      it "returns the word and root word" do
        search = SearchPresenter.new('foxes')

        expect(search.word).to eq('foxes')
        expect(search.root).to eq('fox')
      end

      it "tests if word is valid" do
        valid_search = SearchPresenter.new('foxes')
        invalid_search = SearchPresenter.new('foxez')

        expect(valid_search.is_valid?).to be_truthy
        expect(invalid_search.is_valid?).to be_falsey
      end
    end
  end
end
