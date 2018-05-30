module Api
  module V1
    class PlaysController < ApiController
      def create
        game = Game.find(params[:game_id])
        player = request.headers["HTTP_USER_ID"]
        word = request.headers["HTTP_WORD"]
        game.plays.create(user_id: player, word: word)
        render json: game, status: 201
      end
    end
  end
end
