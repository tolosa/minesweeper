class GamesController < ApplicationController

  def index

  end

  def reveal
    board.reveal(params[:row].to_i, params[:column].to_i)
    redirect_to action: :index
  end

  def reset
    board.reset!
    redirect_to action: :index
  end

end
