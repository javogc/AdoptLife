class Event < ActiveRecord::Base
  has_many :event_organizers
  has_many :animal_attendants
  has_many :organizers, :through => :event_organizers, :source => :user
  has_many :animals, :through => :animal_attendants
end
