=begin
You like hosting people for dinner so
you want to build a dinner party invitation site.
- A user can create parties,
- invite people to a party,
- and accept an invitation to someone else's party.
=end

class User < ActiveRecord::Base
  has_many :parties
  has_many :party_attendences
  has_many :invitations
end

class Invitation < ActiveRecord::Base
  belongs_to :host, :class_name => 'User'
  belongs_to :guest, :class_name => 'User'
  belongs_to :party
end

class Party < ActiveRecord::Base
  has_one :invitations
  belongs_to :host, :class_name => 'User'
  has_many :party_attendences
end

class PartyAttendence
  belongs_to :party
  belongs_to :user
end
