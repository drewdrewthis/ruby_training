class Post < ApplicationRecord
  validates :url, presence: true
  validates :user_id, presence: true

  belongs_to :user
  has_many :comments
end
