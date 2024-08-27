class MessagesController < ApplicationController
  before_action :set_uuid
  include Pagy::Backend

  def index
    @messages = Message.order(created_at: :desc).limit(10)
  end

  def create
    @message = Message.new(message_params)

    if @message.save
      respond_to do |format|
        format.turbo_stream { @message.broadcast_prepend_to "messages" }
        format.html { redirect_to root_path }
      end
    else
      head :bad_request
    end
  end

  def all
    @pagy, @messages = pagy(Message.order(created_at: :desc), limit: 10)
  end

  private

  def set_uuid
    session[:uuid] = SecureRandom.uuid if session[:uuid].blank?
  end

  def message_params
    params.require(:message).permit(:uuid, :content)
  end
end
