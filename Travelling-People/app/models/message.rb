class Message < ApplicationRecord

	belongs_to :conversation
	belongs_to :user

	validates :body, :presence => true
	validates :conversation_id, :presence => true
	validates :user_id, :presence => true

	# formatting timestamp
	def message_time
      		created_at.strftime("%d/%m/%y at %l:%M %p")
    	end

end
