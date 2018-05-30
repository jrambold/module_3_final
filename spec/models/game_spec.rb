require 'rails_helper'

describe Game do
  context "Instance methods" do
    context "scores" do
      it "sums player 1 and player 2 scores" do
        obi = User.create(name: "Obi-Wan")
        ani = User.create(name: "Anakin")

        game = Game.create(player_1: obi, player_2: ani)

        obi.plays.create(game: game, word: "sal", score: 3)
        obi.plays.create(game: game, word: "zoo", score: 12)
        ani.plays.create(game: game, word: "josh", score: 14)
        ani.plays.create(game: game, word: "no", score: 2)

        expect(game.player_1_score).to eq(15)
        expect(game.player_2_score).to eq(16)
      end
    end
  end
end
