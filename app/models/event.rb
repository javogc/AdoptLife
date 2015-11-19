class Event < ActiveRecord::Base
  has_many :event_organizers
  has_many :animal_attendants
  has_many :organizers, :through => :event_organizers, :source => :user
  has_many :animals, :through => :animal_attendants

  validates :date,:name,:addrline1,:addrline2,:description,presence: true
  validate :name, uniqueness: true
end
