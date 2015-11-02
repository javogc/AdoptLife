class Animal < ActiveRecord::Base
  belongs_to :rescuer, :class_name => 'User'
  belongs_to :adoptant, :class_name => 'User'
  has_many :fans, :class_name =>'User', foreign_key: 'fan_id'
  has_many :events
  mount_uploader :photo, PictureUploader
end
