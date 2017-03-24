class BotsController < ApplicationController
  before_action :set_bot, only: [:show, :update, :destroy, :brain]

  # GET /bots
  def index
    @bots = Bot.all

    render json: @bots
  end

  # GET /bots/1
  def show
    render json: @bot
  end

  # POST /bots
  def create
    @bot = Bot.new(bot_params)

    if @bot.save
      render json: @bot, status: :created, location: @bot
    else
      render json: @bot.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bots/1
  def update
    if @bot.update(bot_params)
      render json: @bot
    else
      render json: @bot.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bots/1
  def destroy
    @bot.destroy
  end

  def brain
    data = Brain::Extractor.extract!(@bot.id)
    send_data data.to_json, type: 'text/json;', disposition: 'attachment;', filename: 'brain.json'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bot
      @bot = Bot.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def bot_params
      params.permit(:name)
    end
end
