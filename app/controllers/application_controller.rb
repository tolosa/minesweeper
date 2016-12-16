class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  helper_method :board

  ROWS_COUNT = COLUMNS_COUNT = 10
  MINES = 10

  def board
    $board ||= Board.new(ROWS_COUNT, COLUMNS_COUNT, MINES)
  end

end
