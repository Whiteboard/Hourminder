class StatusMessagesController < ApplicationController
  before_action :set_status_message, only: [:show, :edit, :update, :destroy]

  # GET /status_messages
  # GET /status_messages.json
  def index
    @status_messages = StatusMessage.all
  end

  # GET /status_messages/1
  # GET /status_messages/1.json
  def show
  end

  # GET /status_messages/new
  def new
    @status_message = StatusMessage.new
  end

  # GET /status_messages/1/edit
  def edit
  end

  # POST /status_messages
  # POST /status_messages.json
  def create
    @status_message = StatusMessage.new(status_message_params)
    @status_message.user = current_user

    respond_to do |format|
      if @status_message.save
        format.html { redirect_to @status_message, notice: 'Status message was successfully created.' }
        format.json { render :show, status: :created, location: @status_message }
      else
        format.html { render :new }
        format.json { render json: @status_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /status_messages/1
  # PATCH/PUT /status_messages/1.json
  def update
    respond_to do |format|
      if @status_message.update(status_message_params)
        format.html { redirect_to @status_message, notice: 'Status message was successfully updated.' }
        format.json { render :show, status: :ok, location: @status_message }
      else
        format.html { render :edit }
        format.json { render json: @status_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /status_messages/1
  # DELETE /status_messages/1.json
  def destroy
    @status_message.destroy
    respond_to do |format|
      format.html { redirect_to status_messages_url, notice: 'Status message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_status_message
      @status_message = StatusMessage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def status_message_params
      params.require(:status_message).permit(:user_id, :status)
    end
end
