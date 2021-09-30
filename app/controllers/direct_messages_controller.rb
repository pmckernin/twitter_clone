class DirectMessagesController < ApplicationController
  before_action :set_direct_message, only: %i[show edit update destroy]

  # GET /direct_messages
  def index
    @q = DirectMessage.ransack(params[:q])
    @direct_messages = @q.result(distinct: true).includes(:sender,
                                                          :recipient).page(params[:page]).per(10)
  end

  # GET /direct_messages/1
  def show; end

  # GET /direct_messages/new
  def new
    @direct_message = DirectMessage.new
  end

  # GET /direct_messages/1/edit
  def edit; end

  # POST /direct_messages
  def create
    @direct_message = DirectMessage.new(direct_message_params)

    if @direct_message.save
      message = "DirectMessage was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @direct_message, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /direct_messages/1
  def update
    if @direct_message.update(direct_message_params)
      redirect_to @direct_message,
                  notice: "Direct message was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /direct_messages/1
  def destroy
    @direct_message.destroy
    message = "DirectMessage was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to direct_messages_url, notice: message
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_direct_message
    @direct_message = DirectMessage.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def direct_message_params
    params.require(:direct_message).permit(:sender_id, :recipient_id, :body)
  end
end
