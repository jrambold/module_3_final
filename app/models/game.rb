class Game < ApplicationRecord
  belongs_to :player_1, class_name: "User", foreign_key: :player_1_id
  belongs_to :player_2, class_name: "User", foreign_key: :player_2_id

  has_many :plays

  def player_1_score
    player_score(player_1)
  end

  def player_2_score
    player_score(player_2)
  end

  private

  def player_score(player)
    player_scores = plays.where(user: player).sum(:score)
  end
end
