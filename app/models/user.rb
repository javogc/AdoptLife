class User < ActiveRecord::Base
  has_many :rescued_animals,
            :class_name => 'Animal',
            :foreign_key => 'rescuer_id', dependent: :destroy
  has_many :adopted_animals,
            :class_name => 'Animal',
            :foreign_key => 'adoptant_id', dependent: :destroy
  has_secure_password
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_animals, :through => :bookmarks, :source => :animal
  has_many :event_organizers, dependent: :destroy
  has_many :events_organized, :through => :event_organizers, :source => :event

  validates :email,:fname,:lname,:password, presence: true
  validates :email, uniqueness: true
end
