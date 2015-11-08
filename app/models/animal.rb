class Animal < ActiveRecord::Base
  belongs_to :user, class_name: "Rescuer", foreign_key: "rescuer_id"
  belongs_to :user, class_name: "Adoptant",foreign_key: "adoptant_id"
  has_and_belongs_to_many :users, class_name:"Fans", foreign_key: "fan_id"
  has_and_belongs_to_many :events
end
