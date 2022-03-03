class GamesController < ApplicationController
  before_action :set_game, only: %i[show update]

  # GET /games/1 or /games/1.json
  def show
    render json: {
      total_score: @game.total_score.value,
      frame_score: @game.frame_score.elements
    }, status: :ok
  end

  # POST /games or /games.json
  def create
    @game = Game.new

    if @game.save
      render :show, status: :created, location: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /games/1 or /games/1.json
  def update
    pin_score = params[:pins].to_i

    unless pin_score.between?(0, 10)
      render json: {error: "Pins must be between 0 to 10."}, status: :bad_request
      return
    end

    @game.record_pins(pin_score)
    @game.calculate_score
    head :ok
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_game
    @game = Game.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def game_params
    params.require(:game).permit(:pins)
  end
end
