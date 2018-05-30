require 'rails_helper'

describe 'POST /api/v1/games/:id/plays' do
  context 'with an existing game' do
    it 'increments a players score' do
      game = create(:game)

      score = game.player_1_score

      headers = { "HTTP_USER_ID" => game.player_1.id, "HTTP_WORD" => "at" }
      post "/api/v1/games/#{game.id}/plays", headers: headers

      actual  = JSON.parse(response.body, symbolize_names: true)

      expect(game.player_1_score).to eq(score + 2)
    end

    it 'returns invalid json if word does not exist' do
      game = create(:game)

      score = game.player_1_score

      headers = { "HTTP_USER_ID" => game.player_1.id, "HTTP_WORD" => "foxez" }
      post "/api/v1/games/#{game.id}/plays", headers: headers

      actual  = JSON.parse(response.body, symbolize_names: true)

      expect(actual).to eq({message: "foxez is not a valid word."})
    end
  end
end
