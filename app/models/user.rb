class User < ApplicationRecord

    before_save { self.email = email.downcase }
    has_secure_password
    has_many :ideas, dependent: :nullify
    has_many :reviews, dependent: :destroy


    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: { maximum: 50 }
    validates :password, presence: true

end
