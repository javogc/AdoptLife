class AddAdoptantRefToAnimals < ActiveRecord::Migration
  def change
    add_reference :animals, :adoptant, index: true
  end
end
