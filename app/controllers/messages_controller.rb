class MessagesController < ApplicationController
  def index
  end

  def create
    if params[:comment].blank?
      head :bad_request
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.prepend("messages", partial: "messages/message", locals: { message: params[:comment] }) }
        format.html { redirect_to root_path }
      end
    end
  end

  def all
  end
end
