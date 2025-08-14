class GamesController < ApplicationController
  before_action :set_game, only: [:show, :vote, :results]
  
  def index
    @games = GameStore.all_games.sort_by(&:created_at).reverse
  end
  
  def new
    @game = GameSession.new
  end
  
  def create
    @game = GameStore.create_game(game_params)
    
    if @game.valid?
      redirect_to "/game/#{@game.token}", notice: "Game created successfully! Share this link: #{request.base_url}/game/#{@game.token}"
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def show
    @employee_name = session[:employee_name]
    @has_voted = @game.employee_has_voted?(@employee_name) if @employee_name
  end
  
  def vote
    employee_name = params[:employee_name].strip
    
    if employee_name.blank?
      redirect_to "/game/#{@game.token}", alert: 'Please enter your name to vote.'
      return
    end
    
    if @game.employee_has_voted?(employee_name)
      redirect_to "/game/#{@game.token}", alert: 'You have already voted in this game.'
      return
    end
    
    if @game.add_vote(employee_name, params[:statement_id])
      session[:employee_name] = employee_name
      redirect_to "/game/#{@game.token}/results", notice: 'Vote recorded successfully!'
    else
      redirect_to "/game/#{@game.token}", alert: 'Failed to record vote. Please try again.'
    end
  end
  
  def results
    @total_votes = @game.total_votes
  end
  
  private
  
  def set_game
    @game = GameStore.find_game(params[:token])
    
    unless @game
      redirect_to root_path, alert: 'Game not found or has expired.'
      return
    end
  end
  
  def game_params
    params.require(:game_session).permit(:candidate_name, :candidate_photo, 
                                        statements_attributes: [:content, :is_truth])
  end
end
