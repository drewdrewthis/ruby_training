class Event < ApplicationRecord
  validates :title, :description, :date, presence: true
  validates :user_id, presence: true

  belongs_to :creator, :class_name => 'User', :foreign_key => 'user_id'
end
