require 'rails_helper'

describe 'GET /api/v1/games/:id' do
  context 'with an existing game' do
    it 'returns a formatted game json' do
      game = create(:game)

      get "/api/v1/games/#{game.id}"

      actual  = JSON.parse(response.body, symbolize_names: true)
      
      expect(actual[:game_id]).to eq(game.id)
      expect(actual[:scores].first[:user_id]).to eq(game.player_1.id)
      expect(actual[:scores].first[:score]).to eq(game.player_1_score)
      expect(actual[:scores].last[:user_id]).to eq(game.player_2.id)
      expect(actual[:scores].last[:score]).to eq(game.player_2_score)
    end
  end
end
