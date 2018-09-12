class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
				 :trackable, :omniauthable, :omniauth_providers => [:google_oauth2]

	mount_uploader :fotoProfilo, FotoProfiloUploader

	validate  :dim_fotoProfilo

	def self.from_omniauth(auth) 
		where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
			user.email = auth.info.email
			user.fotoProfilo = auth.info.image
		end
	end

	def self.new_with_session(params, session) 
		super.tap do |user|
			if data = session["devise.google_data"] && session["devise.google_data"]["extra"]["raw_info"]
				user.email = data["email"] if user.email.blank?
			end
   	end
	end

	private
  def dim_fotoProfilo
		if fotoProfilo.size > 5.megabytes
			errors.add(:fotoProfilo, "L'immagine deve essere inferiore a 5MB")
    end
  end
end
