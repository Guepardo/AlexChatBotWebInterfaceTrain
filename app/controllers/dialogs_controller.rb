class DialogsController < ApplicationController
  before_action :set_dialog, only: [:show, :update, :destroy]

  # GET /dialogs
  def index
    @dialogs = Topic.find(params[:topic_id]).dialogs

    render json: @dialogs
  end

  # GET /dialogs/1
  def show
    render json: @dialog
  end

  # POST /dialogs
  def create
    intent = find_intent(params[:intent_id])

    @dialog = Dialog.new(dialog_params)

    if @dialog.save
      intent.dialog_id = @dialog.id
      intent.save
      render json: @dialog, status: :created
    else
      render json: @dialog.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /dialogs/1
  def update
    switch_intent(@dialog.id, params[:intent_id])

    if @dialog.update(dialog_params)
      render json: @dialog
    else
      render json: @dialog.errors, status: :unprocessable_entity
    end
  end

  # DELETE /dialogs/1
  def destroy
    free_intent @dialog.id
    @dialog.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dialog
      @dialog = Dialog.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dialog_params
      params.permit(:name, :topic_id)
    end

    def free_intent(dialog_id)
      intent = Intent.where(dialog_id: dialog_id).take      
      unless intent.nil?
        intent.dialog_id = nil
      end
    end

    def find_intent(intent_id)
      Intent.find(intent_id)
    end

    def switch_intent(dialog_id, intent_id)
      intent = Intent.where(dialog_id: dialog_id).take
      
      if intent.id != intent_id
        intent.dialog_id = nil
        intent.save 
        intent = find_intent(intent_id)
        intent.dialog_id = dialog_id
        intent.save
      end
    end
end
