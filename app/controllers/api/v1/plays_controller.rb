module Api
  module V1
    class PlaysController < ApiController
      def create
        game = Game.find(params[:game_id])
        word = request.headers["HTTP_WORD"]
        search = Search.new(word)
        if search.word_root
          game.plays.create(user_id: request.headers["HTTP_USER_ID"], word: word)
          render json: game, status: 201
        else
          render json: { "message": "#{word} is not a valid word." }
        end
      end
    end
  end
end
