class Conversation < ApplicationRecord

	# sender_id e receiver_id sono entrambi degli user id
	belongs_to :sender, class_name: 'User', foreign_key: "sender_id"
	belongs_to :receiver, class_name: 'User', foreign_key: "receiver_id"

	has_many :messages, dependent: :destroy

	validates :sender, uniqueness: {scope: :receiver}

	# class method che controlla se esiste una conversation tra due utenti
	scope :between, -> (sender_id, receiver_id) do
		where(sender_id: sender_id, receiver_id: receiver_id).or(where(sender_id: receiver_id, receiver_id: sender_id)).limit(1)
	end

	def with(current_user)
		sender == current_user ? receiver : sender
	end

	def participates?(user)
		sender == user || receiver == user
	end

	def unread_message_count(current_user)
	    	self.messages.where("user_id != ? AND read = ?", current_user.id, false).count
	end
	
end
