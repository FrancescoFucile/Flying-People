class MessageAbusesController < ApplicationController

	before_action :find_admin!
	after_action :set_to_read!, only: [:index]

	def new
		@message_abuse = MessageAbuse.new	
	end

  def create
    @message_abuse = MessageAbuse.new(message_abuse_params)	
    if @message_abuse.save
	    flash[:success] = "Segnalazione anonima inviata correttamente! Grazie per la tua collaborazione"
			redirect_to root_path
	  end
	end

	def index
		@message_abuses = MessageAbuse.all
		if @message_abuses.nil?
			flash[:info] = 'Nessun abuso segnalato'
		end
  	end

  private
  def message_abuse_params
    params.require(:message_abuse).permit(:body).merge(admin_id: @admin.id)
  end

  def find_admin!
	@admin = User.find_by(admin: true)
  end

  def set_to_read!
    @message_abuses.where("read = ?", false).update_all(read: true)
  end

end
