class Animal < ActiveRecord::Base
  belongs_to :rescuer, :class_name => 'User'
  belongs_to :adoptant, :class_name => 'User'
  has_many :bookmarkers, :through => :bookmarks, :source => :user
  has_many :bookmarks
  has_many :events
  has_many :requests, inverse_of: :animal
  mount_uploader :photo, PictureUploader
  has_many :animal_attendants
  has_many :events, :through => :animal_attendants

  validates :name,:species,:details,:size, presence: true
  validates :name, uniqueness: true
end
