class Idea < ApplicationRecord
    belongs_to :user, optional: true
    has_many :reviews, dependent: :destroy
    has_many :likes
    has_many :likers, through: :likes  , source: :user

    validates :title, presence: true
    validates :body, presence: true

end
