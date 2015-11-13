class User < ActiveRecord::Base
  has_many :events
  has_many :conversations
  has_many :rescued_animals,
            :class_name => 'Animal',
            :foreign_key => 'rescuer_id'
  has_many :adopted_animals,
            :class_name => 'Animal',
            :foreign_key => 'adoptant_id'
  has_secure_password
end
