class MessageAbuse < ApplicationRecord

	belongs_to :admin, class_name: 'User', foreign_key: "admin_id"

	validates :body, :presence => true
	validates :admin_id, :presence => true

	validate :receiver_is_admin

	# formatting timestamp
	def message_time
      		created_at.strftime("%d/%m/%y at %l:%M %p")
    	end

	private
	def receiver_is_admin
		if !User.find_by(id: admin_id).admin?
			errors.add(:message_abuse, "Solo l'admin può ricevere messaggi di segnalazione")
		end
	end

end
