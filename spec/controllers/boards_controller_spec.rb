# spec/controllers/boards_controller_spec.rb
require 'rails_helper'

RSpec.describe BoardsController, type: :controller do
  describe 'GET #index' do
    it 'assigns recent boards' do
      recent_boards = create_list(:board, 5)
      get :index
      expect(assigns(:recent_boards)).to match_array(recent_boards)
    end

    it 'assigns all boards' do
      boards = create_list(:board, 10)
      get :index
      expect(assigns(:boards)).to match_array(boards)
    end

    it 'renders index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'POST #create' do
    it 'creates a new board' do
      expect {
        post :create, params: { board: { email: 'test@example.com', rows: 5, cols: 5, mines: 5 } }
      }.to change(Board, :count).by(1)
    end

    it 'redirects to the new board' do
      post :create, params: { board: { email: 'test@example.com', rows: 5, cols: 5, mines: 5 } }
      expect(response).to redirect_to(Board.last)
    end

    it 'redirect to root with unprocessable_entity if mines are greater than the total number of cells' do
      post :create, params: { board: { email: 'test@example.com', rows: 0, cols: 5, mines: 5 } }
      expect(response).to have_http_status(:unprocessable_entity) and redirect_to('/')
    end
  end

  describe 'GET #show' do
    it 'assigns the requested board' do
      board = create(:board)
      get :show, params: { id: board.id }
      expect(assigns(:board)).to eq(board)
    end

    it 'assigns mines_board' do
      board = create(:board)
      get :show, params: { id: board.id }
      expect(assigns(:mines_board)).to_not be_nil
    end

    it 'redirects to root path if board is not found' do
      get :show, params: { id: 'invalid_id' }
      expect(response).to redirect_to('/')
    end
  end
end
