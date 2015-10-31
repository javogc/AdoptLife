class AddRescuerRefToAnimals < ActiveRecord::Migration
  def change
    add_reference :animals, :rescuer, index: true
  end
end
