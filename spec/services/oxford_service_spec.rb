require 'rails_helper'

describe OxfordService do
  context "Instance methods" do
    context "get_url" do
      it "returns json for valid word" do
        search_service = OxfordService.new
        raw_dictionary = search_service.get_url("/api/v1/inflections/en/foxes")
        root = raw_dictionary[:results].first[:lexicalEntries].first[:inflectionOf].first[:id]
        expect(root).to eq('fox')
      end

      it "returns nil for anything other than json" do
        search_service = OxfordService.new
        result = search_service.get_url("/api/v1/inflections/en/foxez")

        expect(result).to be_nil
      end
    end
    context "get_inflections" do
      it "returns json for valid word" do
        search_service = OxfordService.new
        raw_dictionary = search_service.get_inflections("foxes")
        root = raw_dictionary[:results].first[:lexicalEntries].first[:inflectionOf].first[:id]
        expect(root).to eq('fox')
      end
    end
  end
end
