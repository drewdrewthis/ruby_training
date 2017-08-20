class User < ApplicationRecord
  validate :username, presence: true

  has_many :events
  has_many :invitations
end
