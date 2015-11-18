class AddDateTimeLocationToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :date, :date
    add_column :requests, :time, :time
    add_column :requests, :location, :string
  end
end
