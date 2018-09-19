class MessagesController < ApplicationController
  before_action :find_conversation!

	def new
		redirect_to conversation_path(@conversation) and return if @conversation
	  @message = current_user.messages.new	
	end

  def create
		@conversation ||= Conversation.create(sender_id: current_user.id, receiver_id: @receiver.id)
    @message = current_user.messages.new(message_params)	
    @message.conversation_id = @conversation.id
    if @message.save
	    flash[:success] = "Messaggio inviato!"
			redirect_to conversation_path(@conversation)
	  end
	end

  private
  def message_params
    params.require(:message).permit(:body)
  end

  def find_conversation!
    if params[:receiver_id]
    	@receiver = User.find_by(id: params[:receiver_id])
    	redirect_to(root_path) and return unless @receiver
    	@conversation = Conversation.between(current_user.id, @receiver.id).first	
  	else
    	@conversation = Conversation.find(params[:conversation_id]) 
    	redirect_to(root_path) and return unless @conversation && @conversation.participates?(current_user)
  	end
	end
end
