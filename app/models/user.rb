class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  def self.find_for_oauth(auth, signed_in_resource = nil)

    # user와 identity가 nil이 아니라면 받는다
    identity = Identity.find_for_oauth(auth)
    user = signed_in_resource ? signed_in_resource : identity.user

    # new user if user info nil
    if user.nil?
      # 이미 있는 이메일인지 확인한다.
      email = auth.info.email
      user = User.where(:email => email).first

      unless self.where(email: auth.info.email).exists? 
        # not info -> create user
        if user.nil?
            user = User.new(
              email: auth.info.email,
              profile_img: auth.info.image,
              # remote_profile_img_url: auth.info.image.gsub('http://','https://'),
              password: Devise.friendly_token[0,20],
              user_level: 10
            )
          user.save!
        end
      end
    end
    if identity.user != user
      identity.user = user
      identity.save!
    end
    user
  end
end