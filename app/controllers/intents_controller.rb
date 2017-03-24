class IntentsController < ApplicationController
  before_action :set_intent, only: [:show, :update, :destroy]

  # GET /intents
  def index
    # TODO: Criar um membro para alimentar somente os selects. 
    # @intents = Bot.find(params[:bot_id]).intents
    @intents = Intent.where('bot_id = :bot_id', {bot_id: params[:bot_id].to_i})
    render json: @intents
  end

  # GET /intents/1
  def show
    render json: @intent
  end

  # POST /intents
  def create
    @intent = Intent.new(intent_params)

    if @intent.save
      render json: @intent, status: :created
    else
      render json: @intent.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /intents/1
  def update
    @intent.statements.each { |temp| temp.delete }

    if @intent.update(intent_params)
      render json: @intent
    else
      render json: @intent.errors, status: :unprocessable_entity
    end
  end

  # DELETE /intents/1
  def destroy
    @intent.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intent
      @intent = Intent.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def intent_params
      params.permit(:id, :name, :bot_id, :dialog_id, :description)
    end
end
