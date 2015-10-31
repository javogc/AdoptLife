class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :name
      t.string :photo
      t.string :type
      t.text :details
      t.string :size

      t.timestamps null: false
    end
  end
end
