class Animal < ActiveRecord::Base
  belongs_to :rescuer, :class_name => 'User'
  belongs_to :adoptant, :class_name => 'User'
  has_many :bookmarkers, :through => :bookmarks, :source => :user
  has_many :bookmarks
  has_many :events
  has_many :requests
  mount_uploader :photo, PictureUploader
end
