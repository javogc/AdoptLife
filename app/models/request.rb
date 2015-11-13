class Request < ActiveRecord::Base
  belongs_to :animal
  belongs_to :sender, :class_name => 'User'
  belongs_to :recipient, :class_name => 'User'
end
