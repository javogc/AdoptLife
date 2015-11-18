class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :fname
      t.string :lname
      t.string :addrline1
      t.string :addrline2
      t.string :city
      t.string :state
      t.string :country
      t.integer :zipcode
      t.integer :available_time
      t.integer :square_meters

      t.timestamps null: false
    end
  end
end
