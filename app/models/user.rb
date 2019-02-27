class User < ApplicationRecord
  validates_presence_of :email, presence: true, uniqueness: true
  validates_presence_of :password, confirmation: true

  has_secure_password

  has_many :user_favorites
  has_many :favorites , through: :user_favorites


  def self.create_user(params)
    user_info = {}
    user_info[:email] = params["email"]
    user_info[:password] = params["password"]
    user_info[:password_confirmation] = params["password_confirmation"]
    user_info[:api_key] = SecureRandom.uuid
    User.create(user_info)
  end
end
