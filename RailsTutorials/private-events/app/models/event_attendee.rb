# == Schema Information
#
# Table name: event_attendees
#
#  id                :integer          not null, primary key
#  attendee_id       :integer
#  attended_event_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class EventAttendee < ApplicationRecord
  belongs_to :attendee, :class_name => 'User'
  belongs_to :attended_event, :class_name => 'Event'
end
