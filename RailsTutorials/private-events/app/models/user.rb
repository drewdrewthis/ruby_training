class User < ApplicationRecord
  validates :username,
    presence: true,
    uniqueness: true

  has_many :events
  has_many :invitations
end