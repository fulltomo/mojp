class RankingsController < ApplicationController
  def index
    @rankings = Ranking.order(score: :desc).limit(20)
  end

  def create
    @ranking = Ranking.new(ranking_params)
    if @ranking.save
      render json: { status: "success" }
    else
      render json: { status: "error", errors: @ranking.errors.full_messages }
    end
  end

  private

  def ranking_params
    params.require(:ranking).permit(:player_name, :score, :time)
  end
end
