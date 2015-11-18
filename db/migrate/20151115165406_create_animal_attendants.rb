class CreateAnimalAttendants < ActiveRecord::Migration
  def change
    create_table :animal_attendants do |t|
      t.references :animal, index: true, foreign_key: true
      t.references :event, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
