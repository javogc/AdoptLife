class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :status
      t.date :date
      t.time :time
      t.string :location
      t.boolean :date_acceptance
      t.boolean :time_acceptance
      t.boolean :location_acceptance
      t.references :animal, index: true
      t.references :recipient, index: true
      t.references :sender, index: true
      t.timestamps null: false
    end
  end
end
