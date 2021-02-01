class User < ApplicationRecord

    before_save { self.email = email.downcase }
    has_secure_password
    has_many :ideas, dependent: :nullify
    has_many :reviews, dependent: :destroy
    has_many :likes
    has_many :liked_ideas, through: :likes, source: :idea

    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 50 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
    validates :password, presence: true, :if => :password

end
