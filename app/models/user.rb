class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

 def self.from_omniauth(access_token)
   data_email = access_token.info['email']
   data_name = access_token.info['name']

   user = User.find_by(email: data_email)

   data = {
     email: data_email,
     name: data_name,
     password: Devise.friendly_token[0, 20]
   }

   user.presence || User.create(data)
 end
end
