class Event < ApplicationRecord
  validates :title, :description, :date, presence: true
  validates :user_id, presence: true

  has_many :event_attendees, :foreign_key => :attended_event_id
  has_many :attendees,
    :through => :event_attendees,
    :source => :attendee

  belongs_to :creator, :class_name => 'User', :foreign_key => 'user_id'
end
