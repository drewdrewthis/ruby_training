class Comment < ApplicationRecord
  validates :post_id, :user_id, presence: true
  validates :body,
    presence: true,
    length: { maximum: 255 }

  belongs_to :user
  belongs_to :post
end
