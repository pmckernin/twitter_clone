class DirectMessagesController < ApplicationController
  before_action :set_direct_message, only: %i[show edit update destroy]

  def index
    @q = DirectMessage.ransack(params[:q])
    @direct_messages = @q.result(distinct: true).includes(:sender,
                                                          :recipient).page(params[:page]).per(10)
  end

  def show; end

  def new
    @direct_message = DirectMessage.new
  end

  def edit; end

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

  def update
    if @direct_message.update(direct_message_params)
      redirect_to @direct_message,
                  notice: "Direct message was successfully updated."
    else
      render :edit
    end
  end

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

  def set_direct_message
    @direct_message = DirectMessage.find(params[:id])
  end

  def direct_message_params
    params.require(:direct_message).permit(:sender_id, :recipient_id, :body)
  end
end
