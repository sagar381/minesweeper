class BoardsController < ApplicationController
  
  before_action :find_board, only: :show
  before_action :check_mines, only: :create

  def index
    @recent_boards = Board.last_ten_records
    @boards = Board.all
  end
  
  def create
    mines_location = BoardCreator.placements(@rows, @cols, @mines)
    @board = Board.new(email: board_params[:email], rows: @rows, cols: @cols, mines: mines_location)
    redirect_to @board if @board.save!
  end
  
  def show
    @mines_board = BoardCreator.fill_board(@board.mines, @board.rows, @board.cols) if @board
  end

  private

  def board_params
    params.require(:board).permit(:email, :rows, :cols, :mines)
  end

  def check_mines
    @rows, @cols, @mines = board_params.values_at(:rows, :cols, :mines).map(&:to_i)

    if @mines > @rows * @cols
      flash[:alert] = "Number of mines can't be greater than the total number of cells."
      redirect_back_or_to '/', status: :unprocessable_entity
    end
  end

  def find_board
    @board = Board.find(params[:id])
  end
end