class AnimalAttendant < ActiveRecord::Base
  belongs_to :animal
  belongs_to :event
end
