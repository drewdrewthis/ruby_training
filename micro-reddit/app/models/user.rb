class User < ApplicationRecord
  validates :username, presence: true,
    uniqueness: true,
    length: { in: 4..20 }
  validates :password, presence: true,
    length: { in: 4..20 }

  has_many :posts
  has_many :comments
end
