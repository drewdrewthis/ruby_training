# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  validates :username,
    presence: true,
    uniqueness: true

  has_many :events

  has_many :event_attendees, :foreign_key => :attendee_id
  has_many :attended_events,
    :through => :event_attendees,
    :source => :attended_event
end
