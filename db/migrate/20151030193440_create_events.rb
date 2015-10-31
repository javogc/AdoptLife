class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.date :date
      t.string :name
      t.string :addrline1
      t.string :addrline2
      t.text :description

      t.timestamps null: false
    end
  end
end
