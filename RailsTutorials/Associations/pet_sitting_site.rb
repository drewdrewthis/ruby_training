=begin
A site for pet-sitting (watching someone's pet while they're gone).
People can babysit for multiple pets and pets can have multiple petsitters.
=end

class Owner < ActiveRecord::Base
  has_many :pets
  has_many :pet_sitters
  has_many :pet_sitting_events
end

class Pet < ActiveRecord::Base
  has_one :owners
  has_many :pet_sitters
  has_many :pet_sitting_events
end

class PetSitter < ActiveRecord::Base
  belongs_to :owners
  belongs_to :pets
  has_many :pet_sitting_events
end

class PetSittingEvent < ActiveRecord::Base
  # field :event_id, <-- for events that involved more than one pet at a time
  belongs_to :pet_sitter
  belongs_to :owners
  belongs_to :pets
end
