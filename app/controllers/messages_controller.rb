class MessagesController < ApplicationController
  # ----------メッセージロジック----------
  def create
    if Entry.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
      @message = Message.create(params.require(:message).permit(:user_id, :image, :room_id).merge(user_id: current_user.id))
      @message.create_notification_message!(current_user, @message.room.id, @message.id)
      redirect_to "/rooms/#{@message.room_id}"
    else
      redirect_back(fallback_location: root_path)
    end
  end
  # ------------------------------------
end
