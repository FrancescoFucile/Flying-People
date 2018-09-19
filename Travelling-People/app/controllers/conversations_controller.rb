class ConversationsController < ApplicationController
  
	before_action :set_conversation, except: [:index]
	before_action :check_participating!, except: [:index]

	def index
		@conversations = Conversation.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
		if @conversations.empty?
			flash[:info] = 'Ancora nessuna chat'
			redirect_to users_path
		end
    		@users = User.where.not(id: current_user.id)
  	end

	def show
  		@message = Message.new
		@conversation.messages.where("user_id != ? AND read = ?", current_user.id, false).update_all(read: true)
	end

	private
	# l'utente deve essere autorizzato a vedere la conversazione
	def set_conversation
		@conversation = Conversation.find(params[:id])
	end

	def check_participating!
  		redirect_to root_path unless @conversation && @conversation.participates?(current_user)
	end
end
