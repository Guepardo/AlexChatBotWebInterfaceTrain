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
    @dialog = Dialog.new(dialog_params)

    if @dialog.save
      render json: @dialog, status: :created
    else
      render json: @dialog.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /dialogs/1
  def update
    if @dialog.update(dialog_params)
      render json: @dialog
    else
      render json: @dialog.errors, status: :unprocessable_entity
    end
  end

  # DELETE /dialogs/1
  def destroy
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
end
