class MessageBroadcastWorker
  include Sidekiq::Worker

  def perform(message_id)
    message = Message.where(id: message_id).first
    ActionCable.server.broadcast "room_#{message.channel_id}_channel:", message: render_message(message)
  end

  private

  def render_message(message)
    ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
  end
end
