class Api::V1::DirectMessagesController < Api::V1::GraphitiController
  def index
    direct_messages = DirectMessageResource.all(params)
    respond_with(direct_messages)
  end

  def show
    direct_message = DirectMessageResource.find(params)
    respond_with(direct_message)
  end

  def create
    direct_message = DirectMessageResource.build(params)

    if direct_message.save
      render jsonapi: direct_message, status: :created
    else
      render jsonapi_errors: direct_message
    end
  end

  def update
    direct_message = DirectMessageResource.find(params)

    if direct_message.update_attributes
      render jsonapi: direct_message
    else
      render jsonapi_errors: direct_message
    end
  end

  def destroy
    direct_message = DirectMessageResource.find(params)

    if direct_message.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: direct_message
    end
  end
end
