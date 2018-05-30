require 'rails_helper'

describe Search do
  context "Instance methods" do
    context "word_root" do
      it "returns the root word" do
        search = Search.new('foxes')
        root = search.word_root

        expect(root).to eq('fox')
      end

      it "returns nil if word does not exist" do
        search = Search.new('foxez')
        root = search.word_root

        expect(root).to be_nil
      end
    end
  end
end
