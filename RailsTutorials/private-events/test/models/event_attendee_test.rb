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

require 'test_helper'

class EventAttendeeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
